using System.Text.Json;
using System.Text.Json.Serialization;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services.GetDataFromServer;

namespace MetanetA_MobileApp.Services.Products;

public static class ProductApiService
{
    private const string ProductsEndpoint =
        "http://webrequests.matanata.com/InfoBase/hs/WebRequestForMobileApp/tasks?Type=GetProducts";

    private static readonly JsonSerializerOptions JsonOptions = new()
    {
        PropertyNameCaseInsensitive = true,
        NumberHandling = JsonNumberHandling.AllowReadingFromString
    };

    public static async Task<IReadOnlyList<ProductApiItem>> GetProductsAsync(
        CancellationToken cancellationToken = default)
    {
        var json = await GetAndPostAllDataForUser.GetAsync(
            ProductsEndpoint,
            cancellationToken);

        if (string.IsNullOrWhiteSpace(json))
            return Array.Empty<ProductApiItem>();

        json = json.Trim().TrimStart('\uFEFF');

        using var document = JsonDocument.Parse(json);

        var sourceElement = ResolveProductsElement(document.RootElement);

        if (sourceElement.ValueKind != JsonValueKind.Array)
        {
            throw new JsonException(
                "Products API JSON array qaytarmadı.");
        }

        var products =
            sourceElement.Deserialize<List<ProductApiItem>>(JsonOptions)
            ?? new List<ProductApiItem>();

        return products;
    }

    private static JsonElement ResolveProductsElement(JsonElement root)
    {
        if (root.ValueKind == JsonValueKind.Array)
            return root;

        if (root.ValueKind != JsonValueKind.Object)
            return root;

        foreach (var propertyName in new[]
                 {
                     "items",
                     "Items",
                     "products",
                     "Products",
                     "data",
                     "Data"
                 })
        {
            if (root.TryGetProperty(propertyName, out var value) &&
                value.ValueKind == JsonValueKind.Array)
            {
                return value;
            }
        }

        return root;
    }
}
