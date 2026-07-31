using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services.UIState;
using MetanetA_MobileApp.View;
using MetanetA_MobileApp.View.Products;
using Microsoft.Maui.Controls;

namespace MetanetA_MobileApp.ViewModels.ProductsViewModels;

[QueryProperty(nameof(ProductItem), "ProductItem")]
public partial class ProductDetailViewModel : BaseViewModel
{
    [ObservableProperty]
    private ProductItem productItem = new();

    [ObservableProperty]
    private bool isVisible;

    private readonly UserInfo userInfo;

    public string Name =>
        ProductItem?.Name ?? string.Empty;

    public ImageSource ProductImageSource =>
        ProductItem?.ProductImageSource ??
        ImageSource.FromFile("product.png");

    public float Price =>
        ProductItem?.Price ?? 0;

    public HtmlWebViewSource AboutTheProductHtml => new()
    {
        Html = BuildHtml(ProductItem?.AboutTheProduct)
    };

    public ProductDetailViewModel(
        UserInfo userInfo,
        BottomMenuState bottomMenu)
        : base(bottomMenu)
    {
        this.userInfo = userInfo;
    }

    partial void OnProductItemChanged(ProductItem value)
    {
        OnPropertyChanged(nameof(Name));
        OnPropertyChanged(nameof(ProductImageSource));
        OnPropertyChanged(nameof(Price));
        OnPropertyChanged(nameof(AboutTheProductHtml));
    }

    private static string BuildHtml(string? htmlBody)
    {
        if (string.IsNullOrWhiteSpace(htmlBody))
            htmlBody = "<p>Məhsul haqqında məlumat yoxdur.</p>";

        // İki $ işarəsi istifadə edilir:
        // CSS daxilində adi { } mötərizələri literal qalır,
        // C# interpolation isə {{htmlBody}} formasında yazılır.
        return $$"""
<!DOCTYPE html>
<html lang="az">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
    <style>
        * {
            box-sizing: border-box;
        }

        html, body {
            width: 100%;
            margin: 0;
            padding: 0;
            background: #ffffff;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont,
                         "Segoe UI", Arial, Helvetica, sans-serif;
            font-size: 14px;
            color: #111827;
            line-height: 1.65;
            padding: 14px;
            overflow-wrap: anywhere;
        }

        h1, h2, h3, h4 {
            color: #111827;
            line-height: 1.3;
            margin: 18px 0 8px;
        }

        h3 {
            font-size: 18px;
        }

        p {
            margin: 0 0 12px;
        }

        ul, ol {
            padding-left: 22px;
        }

        li {
            margin-bottom: 6px;
        }

        img {
            display: block;
            max-width: 100%;
            height: auto;
            margin: 10px auto;
        }

        table {
            width: 100% !important;
            max-width: 100%;
            border-collapse: collapse;
            margin: 14px 0;
            table-layout: auto;
        }

        th, td {
            border: 1px solid #D1D5DB;
            padding: 8px;
            text-align: left;
            vertical-align: top;
            font-size: 12px;
            word-break: break-word;
        }

        th {
            background: #F3F4F6;
            font-weight: 700;
        }

        section, div {
            max-width: 100%;
        }

        .card {
            border: 0;
            padding: 0;
        }
    </style>
</head>
<body>
    {{htmlBody}}
</body>
</html>
""";
    }

    [RelayCommand]
    public async Task Back()
    {
        await Shell.Current.GoToAsync("..");
    }

    [RelayCommand]
    public async Task Buy()
    {
        if (userInfo.BonusOfProfile.CurrentBonus > Price)
            await Shell.Current.GoToAsync($"//{nameof(MainPage)}");
        else
            IsVisible = true;
    }

    [RelayCommand]
    public async Task Decline()
    {
        await Shell.Current.GoToAsync($"//{nameof(ProductPage)}");
    }
}
