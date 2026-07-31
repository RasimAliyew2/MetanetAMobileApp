using CommunityToolkit.Mvvm.ComponentModel;
using Microsoft.Maui.Controls;

namespace MetanetA_MobileApp.Model;

public partial class ProductItem : ObservableObject
{
    private ImageSource? _cachedImageSource;
    private string? _cachedImageKey;

    [ObservableProperty]
    private string name = string.Empty;

    [ObservableProperty]
    private string description = string.Empty;

    [ObservableProperty]
    private string title = string.Empty;

    // Köhnə lokal/URL image istifadəsi ilə uyğunluq üçün saxlanılıb.
    [ObservableProperty]
    private string imageUrl = string.Empty;

    // API-dən gələcək Base64 image dəyəri burada saxlanılır.
    [ObservableProperty]
    private string imageBase64 = string.Empty;

    [ObservableProperty]
    private float price;

    [ObservableProperty]
    private float weight;

    [ObservableProperty]
    private string aboutTheProduct = string.Empty;

    public string Category { get; set; } = string.Empty;
    public string SubCategory { get; set; } = string.Empty;

    public ImageSource ProductImageSource
    {
        get
        {
            var cacheKey = $"{ImageBase64}|{ImageUrl}";

            if (_cachedImageSource is not null &&
                string.Equals(_cachedImageKey, cacheKey, StringComparison.Ordinal))
            {
                return _cachedImageSource;
            }

            _cachedImageSource = CreateImageSource(ImageBase64, ImageUrl);
            _cachedImageKey = cacheKey;

            return _cachedImageSource;
        }
    }

    public string MetaText
    {
        get
        {
            var parts = new List<string>();

            if (Weight > 0)
                parts.Add($"{Weight:0.##} kq");

            if (Price > 0)
                parts.Add($"{Price:0.##} ₼");

            return string.Join("  •  ", parts);
        }
    }

    partial void OnImageBase64Changed(string value)
    {
        ResetImageCache();
    }

    partial void OnImageUrlChanged(string value)
    {
        ResetImageCache();
    }

    partial void OnPriceChanged(float value)
    {
        OnPropertyChanged(nameof(MetaText));
    }

    partial void OnWeightChanged(float value)
    {
        OnPropertyChanged(nameof(MetaText));
    }

    private void ResetImageCache()
    {
        _cachedImageSource = null;
        _cachedImageKey = null;
        OnPropertyChanged(nameof(ProductImageSource));
    }

    private static ImageSource CreateImageSource(
        string? base64Value,
        string? fallbackUrlOrFile)
    {
        if (!string.IsNullOrWhiteSpace(base64Value))
        {
            try
            {
                var normalized = base64Value.Trim();

                if (normalized.StartsWith(
                        "data:image",
                        StringComparison.OrdinalIgnoreCase))
                {
                    var commaIndex = normalized.IndexOf(',');

                    if (commaIndex >= 0 && commaIndex < normalized.Length - 1)
                        normalized = normalized[(commaIndex + 1)..];
                }

                var bytes = Convert.FromBase64String(normalized);

                if (bytes.Length > 0)
                {
                    return ImageSource.FromStream(
                        () => new MemoryStream(bytes, writable: false));
                }
            }
            catch (FormatException)
            {
                // Səhv Base64 app-i dayandırmamalıdır.
            }
        }

        if (!string.IsNullOrWhiteSpace(fallbackUrlOrFile))
        {
            if (Uri.TryCreate(
                    fallbackUrlOrFile,
                    UriKind.Absolute,
                    out var imageUri) &&
                (imageUri.Scheme == Uri.UriSchemeHttp ||
                 imageUri.Scheme == Uri.UriSchemeHttps))
            {
                return ImageSource.FromUri(imageUri);
            }

            return ImageSource.FromFile(fallbackUrlOrFile);
        }

        return ImageSource.FromFile("product.png");
    }
}
