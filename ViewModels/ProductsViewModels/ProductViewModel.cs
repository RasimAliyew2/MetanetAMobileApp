using System;
using System.Collections.ObjectModel;
using System.Linq;
using System.Reflection;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services.UIState;

namespace MetanetA_MobileApp.ViewModels.ProductsViewModels
{
    public partial class ProductViewModel : BaseViewModel
    {
        // Full list
        public ObservableCollection<ProductItem> Products { get; } = new();

        // Filtered list (UI bunu göstərir)
        public ObservableCollection<ProductItem> FilteredProducts { get; } = new();

        // Search text
        [ObservableProperty] private string searchText;

        // Panel open/close
        [ObservableProperty] private bool isCategoryPanelOpen = true;

        public string CategoryPanelIcon => IsCategoryPanelOpen ? "▴" : "▾";

        // Categories / SubCategories
        public ObservableCollection<string> Categories { get; } = new();
        public ObservableCollection<string> SubCategories { get; } = new();

        [ObservableProperty] private string selectedCategory;
        [ObservableProperty] private string selectedSubCategory;

        public bool HasSubCategories => SubCategories.Any();

        // Product selection
        [ObservableProperty] private ProductItem selectedProduct;

        public ProductViewModel(BottomMenuState menuState) : base(menuState)
        {
            // Demo (səndə serverdən gələcək)
            Products.Add(new ProductItem { Name = "Termos", Price = 25, ImageUrl = "product.png" });
            Products.Add(new ProductItem { Name = "Maşın", Price = 1000, ImageUrl = "product.png" });
            Products.Add(new ProductItem { Name = "Rokol Boya", Price = 40, ImageUrl = "product.png" });
            Products.Add(new ProductItem { Name = "Universal Alət", Price = 65, ImageUrl = "product.png" });

            // Kateqoriyalar
            Categories.Add("Hamısı");
            Categories.Add("K1");
            Categories.Add("K2");
            Categories.Add("K3");
            Categories.Add("K4");

            SelectedCategory = "Hamısı";

            ApplyFilters();
        }

        partial void OnSearchTextChanged(string value) => ApplyFilters();

        partial void OnSelectedCategoryChanged(string value)
        {
            BuildSubCategories(value);
            SelectedSubCategory = null;

            OnPropertyChanged(nameof(HasSubCategories));
            ApplyFilters();
        }

        partial void OnSelectedSubCategoryChanged(string value) => ApplyFilters();

        partial void OnIsCategoryPanelOpenChanged(bool value)
        {
            OnPropertyChanged(nameof(CategoryPanelIcon));
        }

        [RelayCommand]
        private void ToggleCategoryPanel()
        {
            IsCategoryPanelOpen = !IsCategoryPanelOpen;
            OnPropertyChanged(nameof(CategoryPanelIcon));
        }

        private void BuildSubCategories(string category)
        {
            SubCategories.Clear();

            if (string.IsNullOrWhiteSpace(category) || category == "Hamısı")
                return;

            // sub kateqoriyalarını burda idarə et
            if (category == "K1")
            {
                SubCategories.Add("S1");
                SubCategories.Add("S2");
            }
            else if (category == "K2")
            {
                SubCategories.Add("S3");
                SubCategories.Add("S4");
            }
            else if (category == "K3")
            {
                SubCategories.Add("S5");
            }
            else if (category == "K4")
            {
                SubCategories.Add("S6");
                SubCategories.Add("S7");
            }
        }

        // ProductItem-də Category/SubCategory/Description yoxdursa belə crash etməsin deyə reflection
        private static string GetStringProp(ProductItem item, string propName)
        {
            if (item == null) return null;

            PropertyInfo pi = item.GetType().GetProperty(propName);
            return pi?.GetValue(item)?.ToString();
        }

        private void ApplyFilters()
        {
            var q = (SearchText ?? "").Trim().ToLowerInvariant();

            var filtered = Products.AsEnumerable();

            // Search: Name + Description (varsa)
            if (!string.IsNullOrWhiteSpace(q))
            {
                filtered = filtered.Where(p =>
                {
                    var name = (p.Name ?? "").ToLowerInvariant();
                    var desc = (GetStringProp(p, "Description") ?? "").ToLowerInvariant();

                    return name.Contains(q) || desc.Contains(q);
                });
            }

            // Category filter
            if (!string.IsNullOrWhiteSpace(SelectedCategory) && SelectedCategory != "Hamısı")
            {
                filtered = filtered.Where(p =>
                {
                    var cat = GetStringProp(p, "Category");
                    return string.Equals(cat, SelectedCategory, StringComparison.OrdinalIgnoreCase);
                });
            }

            // SubCategory filter
            if (!string.IsNullOrWhiteSpace(SelectedSubCategory))
            {
                filtered = filtered.Where(p =>
                {
                    var sub = GetStringProp(p, "SubCategory");
                    return string.Equals(sub, SelectedSubCategory, StringComparison.OrdinalIgnoreCase);
                });
            }

            FilteredProducts.Clear();
            foreach (var p in filtered)
                FilteredProducts.Add(p);
        }

        partial void OnSelectedProductChanged(ProductItem value)
        {
            if (value is null)
                return;

            // burada istəsən detail page açarsan

            // seçimi sıfırla (highlight qalmasın)
            SelectedProduct = null;
        }
    }
}
