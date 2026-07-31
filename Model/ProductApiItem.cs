using System.Text.Json.Serialization;

namespace MetanetA_MobileApp.Model;

public sealed class ProductApiItem
{
    [JsonPropertyName("Weight")]
    public decimal Weight { get; set; }

    [JsonPropertyName("Price")]
    public decimal Price { get; set; }

    [JsonPropertyName("Name")]
    public string Name { get; set; } = string.Empty;

    [JsonPropertyName("Image")]
    public string Image { get; set; } = string.Empty;

    [JsonPropertyName("HTML")]
    public string Html { get; set; } = string.Empty;

    [JsonPropertyName("Language")]
    public string Language { get; set; } = string.Empty;

    [JsonPropertyName("ParentName")]
    public string ParentName { get; set; } = string.Empty;
}
