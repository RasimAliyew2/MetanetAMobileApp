using System.Security.Cryptography;
using System.Text;

namespace MetanetA_MobileApp.Services.GetDataFromServer;

/// <summary>
/// API Image dəyərini mövcud Image.Source string binding-i üçün hazırlayır.
/// URL, resource adı və lokal path olduğu kimi saxlanır.
/// Base64 gəlirsə cache faylına çevrilir.
/// </summary>
public static class ProductImageResolver
{
    public static async Task<string> ResolveAsync(
        string? image,
        string fallback = "product.png")
    {
        if (string.IsNullOrWhiteSpace(image))
            return fallback;

        var value = image.Trim();

        if (Uri.TryCreate(value, UriKind.Absolute, out var uri) &&
            (uri.Scheme == Uri.UriSchemeHttp ||
             uri.Scheme == Uri.UriSchemeHttps ||
             uri.Scheme == Uri.UriSchemeFile))
        {
            return value;
        }

        // MAUI resource adı və ya mövcud lokal path.
        if (value.Length < 180 &&
            (value.Contains('.') ||
             value.Contains('/') ||
             value.Contains('\\')))
        {
            return value;
        }

        var base64 = value;
        var commaIndex = value.IndexOf(',');

        if (value.StartsWith("data:image/", StringComparison.OrdinalIgnoreCase) &&
            commaIndex >= 0)
        {
            base64 = value[(commaIndex + 1)..];
        }

        base64 = RemoveWhitespace(base64);

        // Kiçik normal mətnləri səhvən Base64 saymırıq.
        if (base64.Length < 64)
            return value;

        byte[] bytes;
        try
        {
            bytes = Convert.FromBase64String(base64);
        }
        catch
        {
            return value;
        }

        if (bytes.Length == 0)
            return fallback;

        var extension = DetectExtension(bytes);
        var hash = Convert.ToHexString(SHA256.HashData(bytes)).ToLowerInvariant();

        var directory = Path.Combine(
            FileSystem.CacheDirectory,
            "product-images");

        Directory.CreateDirectory(directory);

        var path = Path.Combine(directory, $"{hash}{extension}");

        if (!File.Exists(path))
            await File.WriteAllBytesAsync(path, bytes);

        return path;
    }

    private static string RemoveWhitespace(string value)
    {
        if (!value.Any(char.IsWhiteSpace))
            return value;

        var builder = new StringBuilder(value.Length);
        foreach (var character in value)
        {
            if (!char.IsWhiteSpace(character))
                builder.Append(character);
        }

        return builder.ToString();
    }

    private static string DetectExtension(ReadOnlySpan<byte> bytes)
    {
        if (bytes.Length >= 8 &&
            bytes[0] == 0x89 &&
            bytes[1] == 0x50 &&
            bytes[2] == 0x4E &&
            bytes[3] == 0x47)
        {
            return ".png";
        }

        if (bytes.Length >= 3 &&
            bytes[0] == 0xFF &&
            bytes[1] == 0xD8 &&
            bytes[2] == 0xFF)
        {
            return ".jpg";
        }

        if (bytes.Length >= 6 &&
            bytes[0] == 0x47 &&
            bytes[1] == 0x49 &&
            bytes[2] == 0x46)
        {
            return ".gif";
        }

        if (bytes.Length >= 12 &&
            bytes[0] == 0x52 &&
            bytes[1] == 0x49 &&
            bytes[2] == 0x46 &&
            bytes[3] == 0x46 &&
            bytes[8] == 0x57 &&
            bytes[9] == 0x45 &&
            bytes[10] == 0x42 &&
            bytes[11] == 0x50)
        {
            return ".webp";
        }

        return ".img";
    }
}
