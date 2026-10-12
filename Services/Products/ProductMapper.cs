using System.Net;
using System.Text.RegularExpressions;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services.GetDataFromServer;

namespace MetanetA_MobileApp.Services.Products;

public static class ProductMapper
{
    private static readonly Regex HtmlTagRegex =
        new("<[^>]+>", RegexOptions.Compiled);

    public static ProductItem ToProductItem(ProductApiItem source)
    {
        var cleanName = NormalizeText(source.Name);
        var cleanParent = NormalizeText(source.ParentName);
        var image = source.Image?.Trim() ?? string.Empty;
        var isRemoteImage = ProductImageResolver.TryGetRemoteUri(image, out _);

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

            // Image sahəsi URL və ya əvvəlki Base64 dəyəri ola bilər.
            ImageUrl = isRemoteImage ? image : string.Empty,
            ImageBase64 = isRemoteImage ? string.Empty : image,

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
        // decimal diapazonu float diapazonundan kiçikdir.
        // Buna görə float.MaxValue-ni decimal-a çevirmək lazım deyil
        // və həmin çevirmə CS0031 xətasına səbəb olurdu.
        return decimal.ToSingle(value);
    }
}
