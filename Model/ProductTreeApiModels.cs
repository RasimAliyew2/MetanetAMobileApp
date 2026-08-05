using System.Text.Json;
using System.Text.Json.Serialization;

namespace MetanetA_MobileApp.Model;

/// <summary>
/// 1C API-dən gələn kök JSON obyektidir:
/// { "Products": [ ... ] }
/// </summary>
public sealed class ProductTreeApiResponse
{
    [JsonPropertyName("Products")]
    public List<ProductTreeApiNode> Products { get; set; } = new();
}

/// <summary>
/// JSON-dakı folder və məhsul üçün ortaq model.
/// Children adi List-dir; UI collection deyil. Buna görə bütün JSON gəlsə də
/// aşağı səviyyələr visual olaraq yaradılmır.
/// </summary>
public sealed class ProductTreeApiNode
{
    [JsonPropertyName("Id")]
    public string? Id { get; set; }

    [JsonPropertyName("ParentId")]
    public string? ParentId { get; set; }

    [JsonPropertyName("Code")]
    public string? Code { get; set; }

    [JsonPropertyName("Description")]
    public string? Description { get; set; }

    [JsonPropertyName("IsFolder")]
    public bool IsFolder { get; set; }

    // Hələlik UI-da göstərilmir. JsonElement seçilməsinin səbəbi:
    // 1C boş dəyəri "" və ya rəqəm kimi qaytara bilər.
    [JsonPropertyName("Weight")]
    public JsonElement Weight { get; set; }

    [JsonPropertyName("Price")]
    public JsonElement Price { get; set; }

    [JsonPropertyName("Name")]
    public string? Name { get; set; }

    [JsonPropertyName("Image")]
    public string? Image { get; set; }

    [JsonPropertyName("HTML")]
    public string? Html { get; set; }

    [JsonPropertyName("Language")]
    public string? Language { get; set; }

    [JsonPropertyName("Children")]
    public List<ProductTreeApiNode> Children { get; set; } = new();

    [JsonIgnore]
    public string DisplayName =>
        !string.IsNullOrWhiteSpace(Name)
            ? Name.Trim()
            : (!string.IsNullOrWhiteSpace(Description)
                ? Description.Trim()
                : (!string.IsNullOrWhiteSpace(Code) ? Code.Trim() : "Məhsul"));

    [JsonIgnore]
    public bool HasChildren => Children is { Count: > 0 };

    public float GetPrice()
    {
        try
        {
            return Price.ValueKind switch
            {
                JsonValueKind.Number when Price.TryGetSingle(out var number) => number,
                JsonValueKind.String when float.TryParse(
                    Price.GetString()?.Replace(',', '.'),
                    System.Globalization.NumberStyles.Any,
                    System.Globalization.CultureInfo.InvariantCulture,
                    out var textNumber) => textNumber,
                _ => 0f
            };
        }
        catch
        {
            return 0f;
        }
    }
}
