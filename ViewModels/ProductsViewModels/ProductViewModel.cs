using System.Collections.ObjectModel;
using System.Reflection;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services.GetDataFromServer;
using MetanetA_MobileApp.Services.UIState;
using MetanetA_MobileApp.View.Products;

namespace MetanetA_MobileApp.ViewModels.ProductsViewModels;

[QueryProperty(nameof(CategoryKey), "CategoryKey")]
public partial class ProductViewModel : BaseViewModel
{
    // Mövcud XAML binding-ləri dəyişmir.
    public ObservableCollection<ProductRootCategorySection> RootCategories { get; } = new();
    public ObservableCollection<ProductItem> SearchResults { get; } = new();

    [ObservableProperty]
    private string? categoryKey;

    [ObservableProperty]
    private string? searchText;

    [ObservableProperty]
    private bool isBusy;

    // ProductPage.xaml bu iki property-ni istifadə edir.
    [ObservableProperty]
    private bool hasError;

    [ObservableProperty]
    private string errorMessage = string.Empty;

    private bool _isDataLoaded;
    private int _searchVersion;

    // Bütün JSON yaddaşda adi model kimi qalır.
    // UI modelləri yalnız istifadəçinin açdığı səviyyə üçün yaradılır.
    private IReadOnlyList<ProductTreeApiNode> _apiRoots =
        Array.Empty<ProductTreeApiNode>();

    private readonly Dictionary<ProductRootCategorySection, ProductTreeApiNode>
        _rootNodeMap = new();

    private readonly Dictionary<ProductSubCategorySection, ProductTreeApiNode>
        _subNodeMap = new();

    private readonly Dictionary<ProductItem, ProductTreeApiNode>
        _productNodeMap = new();

    private readonly Dictionary<ProductItem, ProductSubCategorySection>
        _productOwnerMap = new();

    public bool IsSearchActive =>
        !string.IsNullOrWhiteSpace(SearchText);

    public bool IsCategoryViewVisible => !IsSearchActive;

    public ProductViewModel(BottomMenuState menuState)
        : base(menuState)
    {
        // API constructor-da çağırılmır.
        // Page açıldıqdan sonra LoadAsync işləyir.
    }

    public async Task LoadAsync()
    {
        if ((_isDataLoaded && !HasError) || IsBusy)
            return;

        await LoadProductsAsync();
    }

    // ProductPage.xaml-dəki RetryCommand binding-i üçün.
    [RelayCommand]
    private async Task RetryAsync()
    {
        _isDataLoaded = false;
        await LoadProductsAsync();
    }

    private async Task LoadProductsAsync()
    {
        if (IsBusy)
            return;

        try
        {
            IsBusy = true;
            HasError = false;
            ErrorMessage = string.Empty;

            _apiRoots = await ProductTreeApiClient.GetProductsAsync();

            await LoadOnlyRootFoldersAsync();

            _isDataLoaded = true;

            if (!string.IsNullOrWhiteSpace(CategoryKey))
                await ExpandRootCategoryAsync(CategoryKey);
        }
        catch (Exception exception)
        {
            _isDataLoaded = false;
            HasError = true;
            ErrorMessage =
                "Məhsullar serverdən yüklənmədi. " +
                "İnternet bağlantısını yoxlayıb yenidən cəhd edin.";

            System.Diagnostics.Debug.WriteLine(
                $"Products API error: {exception}");
        }
        finally
        {
            IsBusy = false;
        }
    }

    /// <summary>
    /// İlk açılışda yalnız ən yuxarı Products elementlərini yaradır.
    /// JSON-dakı sıra olduğu kimi saxlanılır; alfabetik və ya manual sort edilmir.
    /// </summary>
    private async Task LoadOnlyRootFoldersAsync()
    {
        RootCategories.Clear();
        _rootNodeMap.Clear();
        ClearAllVisualChildren();

        var index = 0;

        foreach (var node in _apiRoots)
        {
            var key = GetNodeKey(node, index++);
            var image = await ProductImageResolver.ResolveAsync(
                node.Image,
                "product.png");

            var root = new ProductRootCategorySection(
                key,
                node.DisplayName,
                image);

            _rootNodeMap[root] = node;
            RootCategories.Add(root);
        }
    }

    [RelayCommand]
    private async Task ToggleRootCategory(
        ProductRootCategorySection? section)
    {
        if (section is null || IsBusy)
            return;

        var shouldExpand = !section.IsExpanded;

        // Eyni anda yalnız bir root branch visual olaraq saxlanılır.
        foreach (var root in RootCategories)
        {
            if (ReferenceEquals(root, section))
                continue;

            root.IsExpanded = false;
            root.SubCategories.Clear();
        }

        _subNodeMap.Clear();
        ClearProductVisualMaps();

        if (!shouldExpand)
        {
            section.IsExpanded = false;
            section.SubCategories.Clear();
            return;
        }

        section.IsExpanded = true;
        await LoadImmediateChildrenForRootAsync(section);
    }

    /// <summary>
    /// Root kliklənəndə yalnız onun birbaşa child folder-ləri yaradılır.
    /// Child folder-lərin içindəki Products collection boş qalır.
    /// </summary>
    private async Task LoadImmediateChildrenForRootAsync(
        ProductRootCategorySection section)
    {
        section.SubCategories.Clear();

        if (!_rootNodeMap.TryGetValue(section, out var rootNode))
            return;

        ProductSubCategorySection? directProductsSection = null;

        foreach (var child in rootNode.Children)
        {
            if (child.IsFolder || child.HasChildren)
            {
                var subSection = new ProductSubCategorySection(
                    child.DisplayName);

                // Mövcud section modelində image property varsa
                // reflection ilə doldurulur; yoxdursa dizayna toxunulmur.
                var image = await ProductImageResolver.ResolveAsync(
                    child.Image,
                    "product.png");

                TrySetImageProperty(subSection, image);

                _subNodeMap[subSection] = child;
                section.SubCategories.Add(subSection);
                continue;
            }

            // Nadir hal: root-un birbaşa altında məhsul varsa.
            // Mövcud iki-səviyyəli UI pozulmasın deyə bir section altında göstərilir.
            directProductsSection ??= new ProductSubCategorySection(
                rootNode.DisplayName);

            if (!section.SubCategories.Contains(directProductsSection))
            {
                _subNodeMap[directProductsSection] = rootNode;
                section.SubCategories.Add(directProductsSection);
            }
        }

        // Birbaşa məhsullar yalnız section açıldıqdan sonra yaradılacaq.
    }

    [RelayCommand]
    private async Task ToggleSubCategory(
        ProductSubCategorySection? section)
    {
        if (section is null || IsBusy)
            return;

        var parent = RootCategories.FirstOrDefault(
            root => root.SubCategories.Contains(section));

        if (parent is null)
            return;

        var shouldExpand = !section.IsExpanded;

        foreach (var sub in parent.SubCategories)
        {
            if (ReferenceEquals(sub, section))
                continue;

            sub.IsExpanded = false;
            sub.Products.Clear();
        }

        ClearProductVisualMaps();

        if (!shouldExpand)
        {
            section.IsExpanded = false;
            section.Products.Clear();
            return;
        }

        section.IsExpanded = true;
        await LoadImmediateChildrenForSubAsync(section);
    }

    /// <summary>
    /// Son folder kliklənəndə yalnız onun birbaşa child-ları ProductItem olur.
    /// Daha dərin folder gələrsə o da kart kimi görünür və kliklə bir səviyyə açılır.
    /// </summary>
    private async Task LoadImmediateChildrenForSubAsync(
        ProductSubCategorySection section)
    {
        section.Products.Clear();

        if (!_subNodeMap.TryGetValue(section, out var node))
            return;

        IEnumerable<ProductTreeApiNode> children = node.Children;

        // Root-un birbaşa məhsulları üçün yaradılmış section.
        if (_rootNodeMap.Values.Contains(node))
            children = node.Children.Where(child => !child.IsFolder && !child.HasChildren);

        foreach (var child in children)
        {
            var visualItem = await CreateVisualProductAsync(
                child,
                section);

            section.Products.Add(visualItem);
        }
    }

    private async Task<ProductItem> CreateVisualProductAsync(
        ProductTreeApiNode node,
        ProductSubCategorySection owner)
    {
        var image = await ProductImageResolver.ResolveAsync(
            node.Image,
            node.IsFolder || node.HasChildren
                ? "product.png"
                : "product.png");

        var item = new ProductItem
        {
            Name = node.DisplayName,
            Description = node.Description ?? string.Empty,
            Title = node.IsFolder || node.HasChildren
                ? "Folder"
                : string.Empty,
            ImageUrl = image,
            Price = node.IsFolder || node.HasChildren
                ? 0f
                : node.GetPrice(),

            // HTML siyahıda WebView yaratmır.
            // Yalnız məhsul seçiləndə AboutTheProduct-a verilir.
            AboutTheProduct = string.Empty,

            Category = string.Empty,
            SubCategory = owner.Name
        };

        _productNodeMap[item] = node;
        _productOwnerMap[item] = owner;

        return item;
    }

    partial void OnCategoryKeyChanged(string? value)
    {
        if (string.IsNullOrWhiteSpace(value) || !_isDataLoaded)
            return;

        _ = ExpandRootCategoryAsync(value);
    }

    private async Task ExpandRootCategoryAsync(string key)
    {
        var target = RootCategories.FirstOrDefault(root =>
            string.Equals(root.Key, key, StringComparison.OrdinalIgnoreCase) ||
            string.Equals(
                GetSectionTitle(root),
                key,
                StringComparison.OrdinalIgnoreCase));

        if (target is null)
            return;

        foreach (var root in RootCategories)
        {
            if (ReferenceEquals(root, target))
                continue;

            root.IsExpanded = false;
            root.SubCategories.Clear();
        }

        _subNodeMap.Clear();
        ClearProductVisualMaps();

        target.IsExpanded = true;
        await LoadImmediateChildrenForRootAsync(target);
    }

    partial void OnSearchTextChanged(string? value)
    {
        OnPropertyChanged(nameof(IsSearchActive));
        OnPropertyChanged(nameof(IsCategoryViewVisible));

        var version = ++_searchVersion;
        _ = ApplySearchAsync(value, version);
    }

    private async Task ApplySearchAsync(
        string? value,
        int version)
    {
        SearchResults.Clear();

        if (string.IsNullOrWhiteSpace(value))
            return;

        var text = value.Trim();

        // Çox geniş axtarışda yüzlərlə visual kart yaratmırıq.
        var matches = EnumerateAllNodes(_apiRoots)
            .Where(node => !node.IsFolder && !node.HasChildren)
            .Where(node =>
                node.DisplayName.Contains(
                    text,
                    StringComparison.OrdinalIgnoreCase) ||
                (!string.IsNullOrWhiteSpace(node.Description) &&
                 node.Description.Contains(
                     text,
                     StringComparison.OrdinalIgnoreCase)))
            .OrderBy(node =>
                node.DisplayName.StartsWith(
                    text,
                    StringComparison.OrdinalIgnoreCase)
                    ? 0
                    : 1)
            .ThenBy(node => node.DisplayName)
            .Take(50)
            .ToList();

        foreach (var node in matches)
        {
            if (version != _searchVersion)
                return;

            var image = await ProductImageResolver.ResolveAsync(
                node.Image,
                "product.png");

            var item = new ProductItem
            {
                Name = node.DisplayName,
                Description = node.Description ?? string.Empty,
                ImageUrl = image,
                Price = node.GetPrice(),
                AboutTheProduct = string.Empty
            };

            _productNodeMap[item] = node;
            SearchResults.Add(item);
        }
    }

    private static IEnumerable<ProductTreeApiNode> EnumerateAllNodes(
        IEnumerable<ProductTreeApiNode> roots)
    {
        var stack = new Stack<ProductTreeApiNode>(
            roots.Reverse());

        while (stack.Count > 0)
        {
            var node = stack.Pop();
            yield return node;

            for (var index = node.Children.Count - 1;
                 index >= 0;
                 index--)
            {
                stack.Push(node.Children[index]);
            }
        }
    }

    [RelayCommand]
    private void ClearSearch()
    {
        SearchText = string.Empty;
        SearchResults.Clear();
    }

    [RelayCommand]
    private async Task SelectProductAsync(ProductItem? item)
    {
        if (item is null)
            return;

        if (!_productNodeMap.TryGetValue(item, out var node))
        {
            // Mövcud statik item-lər üçün əvvəlki davranış saxlanılır.
            item.AboutTheProduct =
                ProductHtmlStore.GetHtml(item.Name);

            await OpenProductDetailAsync(item);
            return;
        }

        if (node.IsFolder || node.HasChildren)
        {
            // Daha dərin hierarchy olduqda yalnız növbəti səviyyəni göstər.
            if (!_productOwnerMap.TryGetValue(item, out var owner))
                return;

            owner.Products.Clear();
            ClearProductVisualMaps();

            foreach (var child in node.Children)
            {
                var childItem = await CreateVisualProductAsync(
                    child,
                    owner);

                owner.Products.Add(childItem);
            }

            return;
        }

        item.AboutTheProduct = BuildHtmlDocument(
            node.Html,
            node.DisplayName);

        await OpenProductDetailAsync(item);
    }

    private static async Task OpenProductDetailAsync(
        ProductItem item)
    {
        await Shell.Current.GoToAsync(
            $"//{nameof(ProductDetailPage)}",
            new Dictionary<string, object>
            {
                ["ProductItem"] = item
            });
    }

    /// <summary>
    /// API-dən gələn HTML fragmentini WebView üçün tam HTML document edir.
    /// Beləliklə mətn kimi deyil, real HTML kimi render olunur.
    /// </summary>
    private static string BuildHtmlDocument(
        string? html,
        string title)
    {
        if (string.IsNullOrWhiteSpace(html))
            return string.Empty;

        if (html.Contains(
                "<html",
                StringComparison.OrdinalIgnoreCase))
        {
            return html;
        }

        return $$"""
        <!DOCTYPE html>
        <html lang="az">
        <head>
            <meta charset="utf-8" />
            <meta name="viewport"
                  content="width=device-width, initial-scale=1.0" />
            <title>{{System.Net.WebUtility.HtmlEncode(title)}}</title>
            <style>
                body {
                    margin: 0;
                    padding: 12px;
                    font-family: -apple-system, BlinkMacSystemFont,
                                 "Segoe UI", Arial, sans-serif;
                    color: #111827;
                    background: transparent;
                    line-height: 1.5;
                    overflow-wrap: anywhere;
                }

                img, video, iframe, table {
                    max-width: 100%;
                    height: auto;
                }
            </style>
        </head>
        <body>
        {{html}}
        </body>
        </html>
        """;
    }

    private static string GetNodeKey(
        ProductTreeApiNode node,
        int index)
    {
        if (!string.IsNullOrWhiteSpace(node.Code))
            return node.Code.Trim();

        if (!string.IsNullOrWhiteSpace(node.Id))
            return node.Id.Trim();

        return $"root-{index}";
    }

    private void ClearAllVisualChildren()
    {
        foreach (var root in RootCategories)
        {
            root.IsExpanded = false;
            root.SubCategories.Clear();
        }

        _subNodeMap.Clear();
        ClearProductVisualMaps();
    }

    private void ClearProductVisualMaps()
    {
        _productNodeMap.Clear();
        _productOwnerMap.Clear();

        // SearchResults ayrıca visual branch-dir.
        // Search aktivdirsə onun item mapping-i ApplySearchAsync yenidən yaradır.
        if (!IsSearchActive)
            SearchResults.Clear();
    }

    private static void TrySetImageProperty(
        ProductSubCategorySection section,
        string image)
    {
        var type = section.GetType();

        foreach (var propertyName in new[]
                 {
                     "ImageUrl",
                     "Image",
                     "ImageSource"
                 })
        {
            var property = type.GetProperty(
                propertyName,
                BindingFlags.Instance | BindingFlags.Public);

            if (property is null ||
                !property.CanWrite ||
                property.PropertyType != typeof(string))
            {
                continue;
            }

            property.SetValue(section, image);
            return;
        }
    }

    private static string GetSectionTitle(
        ProductRootCategorySection section)
    {
        var type = section.GetType();

        foreach (var propertyName in new[]
                 {
                     "Title",
                     "Name",
                     "Description"
                 })
        {
            var property = type.GetProperty(
                propertyName,
                BindingFlags.Instance | BindingFlags.Public);

            if (property?.GetValue(section) is string value &&
                !string.IsNullOrWhiteSpace(value))
            {
                return value;
            }
        }

        return section.Key;
    }
}
