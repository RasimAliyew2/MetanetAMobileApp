using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.Linq;
using System.Threading.Tasks;
using CommunityToolkit.Maui.Alerts;
using CommunityToolkit.Maui.Core;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services.Cart;
using MetanetA_MobileApp.Services.Sales;
using MetanetA_MobileApp.Services.UIState;
using MetanetA_MobileApp.View.Sales;
using Microsoft.Maui.ApplicationModel;

namespace MetanetA_MobileApp.ViewModels.Sales
{
    public partial class SalesViewModel : BaseViewModel
    {
        private readonly SalesCatalogService _catalog;
        private readonly CartService _cartService;

        // Ana başlıqların açıq/qapalı vəziyyətini yadda saxlayır
        private readonly Dictionary<string, bool> _mainCategoryExpandedStates =
            new(StringComparer.OrdinalIgnoreCase);

        public ObservableCollection<SalesItem> Products => _catalog.Products;

        public ObservableCollection<SalesMainCategoryGroup> FilteredCategories { get; } = new();

        [ObservableProperty]
        private string searchText;

        private static readonly IReadOnlyList<string> MainCategoryOrder = new List<string>
        {
            "İNŞAAT SİSTEMLƏRİ",
            "FASAD SİSTEMLƏRİ",
            "YER-DÖŞƏMƏ SİSTEMLƏRİ",
            "QATQI SİSTEMLƏRİ"
        };

        private static readonly IReadOnlyDictionary<string, IReadOnlyList<string>> SubCategoryOrder =
            new Dictionary<string, IReadOnlyList<string>>(StringComparer.OrdinalIgnoreCase)
            {
                ["İNŞAAT SİSTEMLƏRİ"] = new List<string>
                {
                    "Plitə yapışdırıcıları",
                    "Plitə aralıq doldurucuları",
                    "Təmir, Grout və Ankraj qarışıqları",
                    "Hidroizolyasiya qarışıqları",
                    "Gips əsaslı məhsullar",
                    "Gipskarton lövhələri və gipskarton yardımçı məhsulları",
                    "Gipskarton profil və aksesuarları",
                    "Əhəng məhsulları",
                    "Boya və lak məhsulları: İnşaat Boyaları",
                    "Boya və lak məhsulları: Sənaye Boyaları",
                    "Dekorativ boya və macunlar",
                    "Maye Yapışdırıcı Qrupu",
                    "Astarlar",
                    "Səth qoruma və səth təmizləmə maddələri"
                },
                ["FASAD SİSTEMLƏRİ"] = new List<string>
                {
                    "Mineral Daş yunu",
                    "Termoizolyasiya məhsulları və aksesuarları",
                    "İnovex Quru divar və fasad üzləmə sistemləri",
                    "Dekorativ fasad suvaqları",
                    "Fasad suvaq və hörgü məhsulları",
                    "FASNATURAL - Təbii Ağlay əsaslı fasad lövhələri və arxitektura elementləri"
                },
                ["YER-DÖŞƏMƏ SİSTEMLƏRİ"] = new List<string>
                {
                    "Özüyayılan Şap məhsulları, Self-levelling",
                    "Sement əsaslı Səth Sərtləşdiriciləri",
                    "Epoksid və poliuretan əsaslı döşəmə örtükləri"
                },
                ["QATQI SİSTEMLƏRİ"] = new List<string>
                {
                    "Beton Qatqıları",
                    "Beton yardımçı məhsulları",
                    "Üyütməyə yardımçı məhsullar",
                    "Yeraltı inşaat məhsulları"
                }
            };

        private static readonly Dictionary<string, string> SubCategoryToMainCategory =
            BuildSubCategoryToMainCategoryMap();

        public SalesViewModel(
            SalesCatalogService catalog,
            CartService cartService,
            BottomMenuState menuState)
            : base(menuState)
        {
            _catalog = catalog;
            _cartService = cartService;

            // default olaraq hamısı yığılmış olsun
            foreach (var mainCategory in MainCategoryOrder)
                _mainCategoryExpandedStates[mainCategory] = false;

            ApplyFilter();

            _catalog.Products.CollectionChanged += Products_CollectionChanged;
        }

        private void Products_CollectionChanged(object sender, NotifyCollectionChangedEventArgs e)
        {
            ApplyFilter();
        }

        partial void OnSearchTextChanged(string value)
        {
            ApplyFilter();
        }

        private void ApplyFilter()
        {
            FilteredCategories.Clear();

            var key = (SearchText ?? string.Empty).Trim();
            var hasSearch = !string.IsNullOrWhiteSpace(key);

            var filteredItems = _catalog.Products
                .Where(MatchesSearch)
                .ToList();

            foreach (var mainCategory in MainCategoryOrder)
            {
                var mainGroup = new SalesMainCategoryGroup(mainCategory)
                {
                    // search zamanı uyğun olanlar avtomatik açıq olsun
                    IsExpanded = hasSearch
                        ? true
                        : _mainCategoryExpandedStates.TryGetValue(mainCategory, out var isExpanded) && isExpanded
                };

                var configuredSubCategories = SubCategoryOrder.TryGetValue(mainCategory, out var subList)
                    ? subList
                    : Array.Empty<string>();

                var extraSubCategories = filteredItems
                    .Where(p => string.Equals(ResolveMainCategory(p), mainCategory, StringComparison.OrdinalIgnoreCase))
                    .Select(ResolveSubCategory)
                    .Where(s => !string.IsNullOrWhiteSpace(s))
                    .Where(s => !configuredSubCategories.Any(x => string.Equals(x, s, StringComparison.OrdinalIgnoreCase)))
                    .Distinct(StringComparer.OrdinalIgnoreCase)
                    .OrderBy(s => s)
                    .ToList();

                var allSubCategories = configuredSubCategories
                    .Concat(extraSubCategories)
                    .ToList();

                foreach (var subCategory in allSubCategories)
                {
                    var subGroup = new SalesSubCategoryGroup(subCategory);

                    var subProducts = filteredItems
                        .Where(p =>
                    //        string.Equals(ResolveMainCategory(p), mainCategory, StringComparison.OrdinalIgnoreCase) &&
                            string.Equals(ResolveSubCategory(p), subCategory, StringComparison.OrdinalIgnoreCase))
                        .OrderBy(p => p.Name)
                        .ToList();

                    if (hasSearch && subProducts.Count == 0)
                        continue;

                    foreach (var product in subProducts)
                        subGroup.Products.Add(product);

                    if (!hasSearch || subGroup.Products.Count > 0)
                        mainGroup.SubCategories.Add(subGroup);
                }

                if (!hasSearch || mainGroup.SubCategories.Count > 0)
                    FilteredCategories.Add(mainGroup);
            }

            bool MatchesSearch(SalesItem item)
            {
                if (!hasSearch)
                    return true;

                return ContainsText(item?.Name, key)
                    || ContainsText(item?.Description, key)
                    || ContainsText(item?.Weight, key)
                    || ContainsText(ResolveMainCategory(item), key)
                    || ContainsText(ResolveSubCategory(item), key);
            }
        }

        private static bool ContainsText(string source, string text)
        {
            if (string.IsNullOrWhiteSpace(source) || string.IsNullOrWhiteSpace(text))
                return false;

            return source.IndexOf(text, StringComparison.OrdinalIgnoreCase) >= 0;
        }

        private static string ResolveSubCategory(SalesItem item)
        {
            if (!string.IsNullOrWhiteSpace(item?.SubCategory))
                return item.SubCategory.Trim();

            if (!string.IsNullOrWhiteSpace(item?.Category))
                return item.Category.Trim();

            return "Digər";
        }

        private static string ResolveMainCategory(SalesItem item)
        {
            if (!string.IsNullOrWhiteSpace(item?.MainCategory))
                return item.MainCategory.Trim();

            var subCategory = ResolveSubCategory(item);

            if (SubCategoryToMainCategory.TryGetValue(subCategory, out var mainCategory))
                return mainCategory;

            return string.Empty;
        }

        private static Dictionary<string, string> BuildSubCategoryToMainCategoryMap()
        {
            var result = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);

            foreach (var mainCategory in SubCategoryOrder)
            {
                foreach (var subCategory in mainCategory.Value)
                {
                    if (!result.ContainsKey(subCategory))
                        result.Add(subCategory, mainCategory.Key);
                }
            }

            return result;
        }

        [RelayCommand]
        private void ToggleMainCategory(SalesMainCategoryGroup group)
        {
            if (group == null)
                return;

            group.IsExpanded = !group.IsExpanded;
            _mainCategoryExpandedStates[group.Name] = group.IsExpanded;
        }

        [RelayCommand]
        private void ClearSearch()
        {
            SearchText = string.Empty;
        }

        [RelayCommand]
        private async Task AddToCartAsync(SalesItem product)
        {
            if (product == null)
                return;

            _cartService.Items.Add(new CartLineItem(product, 1));

            try
            {
                HapticFeedback.Default.Perform(HapticFeedbackType.Click);
            }
            catch
            {
            }

            try
            {
                await Snackbar
                    .Make($"{product.Name} səbətə əlavə olundu ✅", duration: TimeSpan.FromSeconds(1))
                    .Show();
            }
            catch
            {
                var toast = Toast.Make("Səbətə əlavə olundu ✅", ToastDuration.Short, 14);
                await toast.Show();
            }
        }

        [RelayCommand]
        private async Task OpenDetailAsync(SalesItem product)
        {
            if (product == null)
                return;

            MainThread.BeginInvokeOnMainThread(async () =>
            {
                await Shell.Current.GoToAsync($"//{nameof(SalesDetailPage)}", new Dictionary<string, object>
                {
                    ["Item"] = product
                });
            });
        }
    }

    public partial class SalesMainCategoryGroup : ObservableObject
    {
        public string Name { get; }

        public ObservableCollection<SalesSubCategoryGroup> SubCategories { get; } = new();

        [ObservableProperty]
        private bool isExpanded;

        public SalesMainCategoryGroup(string name)
        {
            Name = name;
        }
    }

    public class SalesSubCategoryGroup
    {
        public string Name { get; }

        public ObservableCollection<SalesItem> Products { get; } = new();

        public SalesSubCategoryGroup(string name)
        {
            Name = name;
        }
    }
}