using CommunityToolkit.Mvvm.ComponentModel;
using MetanetA_MobileApp.Services.GetDataFromServer;
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

    // API-dən gələn HTTP/HTTPS linki və ya lokal şəkil adı.
    [ObservableProperty]
    private string imageUrl = string.Empty;

    // Əvvəlki API cavabları ilə uyğunluq üçün Base64 dəstəyi.
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
        // URL Base64 kimi decode edilmir. Köhnə modeldə URL ImageBase64
        // sahəsinə yazılıbsa belə, siyahı və detal onu göstərə bilir.
        if (ProductImageResolver.TryGetRemoteUri(fallbackUrlOrFile, out var remoteUri) ||
            ProductImageResolver.TryGetRemoteUri(base64Value, out remoteUri))
        {
            return ImageSource.FromUri(remoteUri);
        }

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
            return ImageSource.FromFile(fallbackUrlOrFile.Trim());
        }

        return ImageSource.FromFile("product.png");
    }
}
