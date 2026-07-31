using System.Net;
using System.Text.RegularExpressions;
using MetanetA_MobileApp.Model;

namespace MetanetA_MobileApp.Services.Products;

public static class ProductMapper
{
    private static readonly Regex HtmlTagRegex =
        new("<[^>]+>", RegexOptions.Compiled);

    public static ProductItem ToProductItem(ProductApiItem source)
    {
        var cleanName = NormalizeText(source.Name);
        var cleanParent = NormalizeText(source.ParentName);

        return new ProductItem
        {
            Name = string.IsNullOrWhiteSpace(cleanName)
                ? "Adsız məhsul"
                : cleanName,

            Title = cleanName,
            Description = cleanParent,
            Category = cleanParent,
            SubCategory = string.Empty,

            Price = ToFloat(source.Price),
            Weight = ToFloat(source.Weight),

            ImageBase64 = source.Image ?? string.Empty,
            ImageUrl = string.Empty,

            // HTML WebView-də render ediləcək, plain string kimi göstərilmir.
            AboutTheProduct = source.Html ?? string.Empty
        };
    }

    public static string NormalizeText(string? value)
    {
        if (string.IsNullOrWhiteSpace(value))
            return string.Empty;

        var withoutTags = HtmlTagRegex.Replace(value, string.Empty);

        return WebUtility.HtmlDecode(withoutTags)
            .Replace('\u00A0', ' ')
            .Trim();
    }

    private static float ToFloat(decimal value)
    {
        if (value > (decimal)float.MaxValue)
            return float.MaxValue;

        if (value < (decimal)float.MinValue)
            return float.MinValue;

        return (float)value;
    }
}
