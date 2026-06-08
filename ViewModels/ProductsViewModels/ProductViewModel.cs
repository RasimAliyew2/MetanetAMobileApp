using System.Collections.ObjectModel;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services.UIState;
using MetanetA_MobileApp.View.Products;

namespace MetanetA_MobileApp.ViewModels.ProductsViewModels;

[QueryProperty(nameof(CategoryKey), "CategoryKey")]
public partial class ProductViewModel : BaseViewModel
{
    public ObservableCollection<ProductRootCategorySection> RootCategories { get; } = new();
    public ObservableCollection<ProductItem> SearchResults { get; } = new();

    [ObservableProperty]
    private string categoryKey;

    [ObservableProperty]
    private string searchText;

    [ObservableProperty]
    private bool isBusy;

    private bool _isDataLoaded;

    public bool IsSearchActive => !string.IsNullOrWhiteSpace(SearchText);
    public bool IsCategoryViewVisible => !IsSearchActive;

    public ProductViewModel(BottomMenuState menuState) : base(menuState)
    {
        // Burada artıq LoadAllCategories çağırmırıq.
        // Çünki constructor UI thread-də işləyir və page açılışını dondururdu.
    }

    public async Task LoadAsync()
    {
        if (_isDataLoaded)
            return;

        try
        {
            IsBusy = true;

            await Task.Yield();

            LoadAllCategoriesLight();

            _isDataLoaded = true;

            if (!string.IsNullOrWhiteSpace(CategoryKey))
                ExpandRootCategory(CategoryKey);
        }
        finally
        {
            IsBusy = false;
        }
    }

    [RelayCommand]
    private void ToggleRootCategory(ProductRootCategorySection section)
    {
        if (section == null)
            return;

        var willExpand = !section.IsExpanded;

        foreach (var cat in RootCategories)
            cat.IsExpanded = false;

        section.IsExpanded = willExpand;
    }
    [RelayCommand]
    private void ToggleSubCategory(ProductSubCategorySection section)
    {
        if (section == null)
            return;

        var parent = RootCategories.FirstOrDefault(root =>
            root.SubCategories.Contains(section));

        if (parent == null)
            return;

        var willExpand = !section.IsExpanded;

        foreach (var sub in parent.SubCategories)
            sub.IsExpanded = false;

        section.IsExpanded = willExpand;
    }
    partial void OnCategoryKeyChanged(string value)
    {
        if (string.IsNullOrWhiteSpace(value))
            return;

        if (!_isDataLoaded)
            return;

        ExpandRootCategory(value);
    }

    partial void OnSearchTextChanged(string value)
    {
        ApplySearch(value);

        OnPropertyChanged(nameof(IsSearchActive));
        OnPropertyChanged(nameof(IsCategoryViewVisible));
    }

    private void ApplySearch(string value)
    {
        SearchResults.Clear();

        if (string.IsNullOrWhiteSpace(value))
            return;

        var text = value.Trim();

        var results = RootCategories
            .SelectMany(root => root.SubCategories)
            .SelectMany(sub => sub.Products)
            .Where(product =>
                !string.IsNullOrWhiteSpace(product.Name) &&
                product.Name.Contains(text, StringComparison.OrdinalIgnoreCase))
            .OrderBy(product => product.Name.StartsWith(text, StringComparison.OrdinalIgnoreCase) ? 0 : 1)
            .ThenBy(product => product.Name)
            .ToList();

        foreach (var item in results)
            SearchResults.Add(item);
    }

    private void LoadAllCategoriesLight()
    {
        RootCategories.Clear();

        foreach (var key in GetRootCategoryOrder())
        {
            if (!ProductCatalog.Data.TryGetValue(key, out var data))
                continue;

            var root = new ProductRootCategorySection(
                key,
                data.Title,
                GetCategoryImage(key));

            foreach (var subName in data.SubCategories)
            {
                var sub = new ProductSubCategorySection(subName);

                if (sub.Name == "Plitə yapışdırıcıları")
                {
                    sub.Products.Add(CreateProduct(
                        "Keramika və Mozoik yapıştırıcısı",
                        data.Title,
                        "plite1.jpg",
                        25));

                    sub.Products.Add(CreateProduct(
                        "Keramika və dekorativ daş yapıştırıcısı",
                        data.Title,
                        "plite2.jpg",
                        16));

                    sub.Products.Add(CreateProduct(
                        "Elastik və yüksək performanslı plitə yapıştırıcısı",
                        data.Title,
                        "plite3.jpg",
                        50));

                    sub.Products.Add(CreateProduct(
                        "Keramika yapıştırıcısı",
                        data.Title,
                        "plite4.jpg",
                        30));
                }

                root.SubCategories.Add(sub);
            }

            RootCategories.Add(root);
        }
    }

    private static ProductItem CreateProduct(
        string name,
        string description,
        string imageUrl,
        float price)
    {
        return new ProductItem
        {
            Name = name,
            Description = description,
            ImageUrl = imageUrl,
            Price = price,

            // Əsas optimizasiya:
            // Siyahı açılarkən böyük HTML yüklənmir.
            AboutTheProduct = string.Empty
        };
    }

    private void ExpandRootCategory(string key)
    {
        var target = RootCategories.FirstOrDefault(x =>
            string.Equals(x.Key, key, StringComparison.OrdinalIgnoreCase));

        if (target == null)
            return;

        foreach (var cat in RootCategories.Where(x => x != target))
        {
            cat.IsExpanded = false;

            foreach (var sub in cat.SubCategories)
                sub.IsExpanded = false;
        }

        target.IsExpanded = true;
    }

    private static IEnumerable<string> GetRootCategoryOrder()
    {
        return new[] { "INSAAT", "FASAD", "YER", "QATQI" };
    }

    private static string GetCategoryImage(string key)
    {
        return key switch
        {
            "INSAAT" => "product_type3.png",
            "FASAD" => "product_type4.png",
            "YER" => "product_type1.png",
            "QATQI" => "product_type2.png",
            _ => "product.png"
        };
    }

 
   
    [RelayCommand]
    private void ClearSearch()
    {
        SearchText = string.Empty;
    }

    [RelayCommand]
    private async Task SelectProductAsync(ProductItem item)
    {
        if (item == null)
            return;

        item.AboutTheProduct = ProductHtmlStore.GetHtml(item.Name);

        await Shell.Current.GoToAsync($"//{nameof(ProductDetailPage)}", new Dictionary<string, object>
        {
            ["ProductItem"] = item
        });
    }
}