using System.Text.Json;
using MetanetA_MobileApp.Model;

namespace MetanetA_MobileApp.Services.GetDataFromServer;

/// <summary>
/// Products JSON-unu 1C HTTP servisindən alır.
/// Endpoint fərqlidirsə yalnız ProductsEndpoint sətrini dəyişmək kifayətdir.
/// </summary>
public static class ProductTreeApiClient
{
    public const string ProductsEndpoint =
        "http://webrequests.matanata.com/InfoBase/hs/WebRequestForMobileApp/tasks?Type=GetProducts";

    private static readonly JsonSerializerOptions JsonOptions = new()
    {
        PropertyNameCaseInsensitive = true,
        AllowTrailingCommas = true,
        ReadCommentHandling = JsonCommentHandling.Skip
    };

    public static async Task<IReadOnlyList<ProductTreeApiNode>> GetProductsAsync()
    {
        var json = await GetAndPostAllDataForUser.GetAsync(
            ProductsEndpoint,
            string.Empty);

        if (string.IsNullOrWhiteSpace(json))
            return Array.Empty<ProductTreeApiNode>();

        json = json.Trim().TrimStart('\uFEFF');

        // Bəzi 1C cavablarında JSON özü JSON-string kimi qaytarıla bilər.
        if (json.Length >= 2 && json[0] == '"' && json[^1] == '"')
        {
            var unwrapped = JsonSerializer.Deserialize<string>(json, JsonOptions);
            if (!string.IsNullOrWhiteSpace(unwrapped))
                json = unwrapped.Trim().TrimStart('\uFEFF');
        }

        using var document = JsonDocument.Parse(json);
        var root = document.RootElement;

        if (root.ValueKind == JsonValueKind.Array)
        {
            return JsonSerializer.Deserialize<List<ProductTreeApiNode>>(
                       root.GetRawText(),
                       JsonOptions)
                   ?? new List<ProductTreeApiNode>();
        }

        if (root.ValueKind != JsonValueKind.Object)
            return Array.Empty<ProductTreeApiNode>();

        foreach (var property in root.EnumerateObject())
        {
            if (!string.Equals(
                    property.Name,
                    "Products",
                    StringComparison.OrdinalIgnoreCase))
            {
                continue;
            }

            return JsonSerializer.Deserialize<List<ProductTreeApiNode>>(
                       property.Value.GetRawText(),
                       JsonOptions)
                   ?? new List<ProductTreeApiNode>();
        }

        return Array.Empty<ProductTreeApiNode>();
    }
}
