using System.Collections.ObjectModel;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services.Products;
using MetanetA_MobileApp.Services.UIState;
using MetanetA_MobileApp.View.Products;

namespace MetanetA_MobileApp.ViewModels.ProductsViewModels;

[QueryProperty(nameof(CategoryKey), "CategoryKey")]
public partial class ProductViewModel : BaseViewModel
{
    private IReadOnlyList<ProductApiItem> _apiProducts =
        Array.Empty<ProductApiItem>();

    private bool _isDataLoaded;

    public ObservableCollection<ProductParentSection> ParentGroups { get; } =
        new();

    public ObservableCollection<ProductItem> SearchResults { get; } =
        new();

    [ObservableProperty]
    private string categoryKey = string.Empty;

    [ObservableProperty]
    private string searchText = string.Empty;

    [ObservableProperty]
    private bool isBusy;

    [ObservableProperty]
    private string errorMessage = string.Empty;

    public bool HasError =>
        !string.IsNullOrWhiteSpace(ErrorMessage);

    public bool IsSearchActive =>
        !string.IsNullOrWhiteSpace(SearchText);

    public bool IsParentViewVisible =>
        !IsSearchActive;

    public ProductViewModel(BottomMenuState menuState)
        : base(menuState)
    {
    }

    public async Task LoadAsync()
    {
        if (_isDataLoaded || IsBusy)
            return;

        await LoadProductsAsync();
    }

    [RelayCommand]
    private async Task RetryAsync()
    {
        await LoadProductsAsync(forceReload: true);
    }

    [RelayCommand]
    private async Task RefreshAsync()
    {
        await LoadProductsAsync(forceReload: true);
    }

    private async Task LoadProductsAsync(bool forceReload = false)
    {
        if (IsBusy)
            return;

        if (_isDataLoaded && !forceReload)
            return;

        try
        {
            IsBusy = true;
            ErrorMessage = string.Empty;

            var products =
                await ProductApiService.GetProductsAsync();

            var languageProducts = products
                .Where(item =>
                    string.IsNullOrWhiteSpace(item.Language) ||
                    string.Equals(
                        item.Language,
                        "az",
                        StringComparison.OrdinalIgnoreCase))
                .ToList();

            // API-də az dili yoxdursa, bütün datanı göstər.
            _apiProducts = languageProducts.Count > 0
                ? languageProducts
                : products;

            BuildParentGroups();

            _isDataLoaded = true;

            // Köhnə category query parametri gəlsə də parent avtomatik
            // açılmır. İlk açılışda yalnız parent-lər vizual görünür.
        }
        catch (Exception ex)
        {
            _isDataLoaded = false;

            ErrorMessage =
                "Məhsullar serverdən yüklənmədi. " +
                "İnternet bağlantısını yoxlayıb yenidən cəhd edin.";

            System.Diagnostics.Debug.WriteLine(
                $"Products API error: {ex}");
        }
        finally
        {
            IsBusy = false;
        }
    }

    private void BuildParentGroups()
    {
        ParentGroups.Clear();
        SearchResults.Clear();

        var groups = _apiProducts
            .GroupBy(
                item =>
                {
                    var parent =
                        ProductMapper.NormalizeText(item.ParentName);

                    return string.IsNullOrWhiteSpace(parent)
                        ? "Digər məhsullar"
                        : parent;
                },
                StringComparer.CurrentCultureIgnoreCase)
            .OrderBy(
                group => group.Key,
                StringComparer.CurrentCultureIgnoreCase);

        foreach (var group in groups)
        {
            // Burada yalnız parent section yaradılır.
            // Child ProductItem vizual modelləri hələ yaradılmır.
            ParentGroups.Add(
                new ProductParentSection(
                    group.Key,
                    group.ToList()));
        }
    }

    [RelayCommand]
    private void ToggleParent(ProductParentSection section)
    {
        if (section is null)
            return;

        var willExpand = !section.IsExpanded;

        foreach (var parent in ParentGroups)
        {
            if (!ReferenceEquals(parent, section))
                parent.IsExpanded = false;
        }

        if (willExpand)
        {
            // Child-lər yalnız parent kliklənəndə UI collection-a əlavə edilir.
            section.EnsureProductsMaterialized();
        }

        section.IsExpanded = willExpand;
    }

    partial void OnSearchTextChanged(string value)
    {
        ApplySearch(value);

        OnPropertyChanged(nameof(IsSearchActive));
        OnPropertyChanged(nameof(IsParentViewVisible));
    }

    partial void OnErrorMessageChanged(string value)
    {
        OnPropertyChanged(nameof(HasError));
    }

    private void ApplySearch(string value)
    {
        SearchResults.Clear();

        if (string.IsNullOrWhiteSpace(value))
            return;

        var searchValue = value.Trim();

        // Axtarış user tərəfindən başladıldığı üçün yalnız uyğun məhsullar
        // həmin anda visual modelə çevrilir.
        var matches = _apiProducts
            .Where(item =>
                ProductMapper.NormalizeText(item.Name)
                    .Contains(
                        searchValue,
                        StringComparison.CurrentCultureIgnoreCase))
            .OrderBy(item =>
                ProductMapper.NormalizeText(item.Name)
                    .StartsWith(
                        searchValue,
                        StringComparison.CurrentCultureIgnoreCase)
                    ? 0
                    : 1)
            .ThenBy(
                item => ProductMapper.NormalizeText(item.Name),
                StringComparer.CurrentCultureIgnoreCase)
            .Take(100);

        foreach (var item in matches)
            SearchResults.Add(ProductMapper.ToProductItem(item));
    }

    [RelayCommand]
    private void ClearSearch()
    {
        SearchText = string.Empty;
    }

    [RelayCommand]
    private async Task SelectProductAsync(ProductItem item)
    {
        if (item is null)
            return;

        await Shell.Current.GoToAsync(
            $"//{nameof(ProductDetailPage)}",
            new Dictionary<string, object>
            {
                ["ProductItem"] = item
            });
    }
}
