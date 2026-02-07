using System;
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

        public ObservableCollection<SalesItem> Products => _catalog.Products;

        public ObservableCollection<SalesItem> FilteredProducts { get; } = new();

        [ObservableProperty]
        private string searchText;

        public SalesViewModel(SalesCatalogService catalog, CartService cartService, BottomMenuState menuState)
            : base(menuState)
        {
            _catalog = catalog;
            _cartService = cartService;

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
            FilteredProducts.Clear();

            var key = (SearchText ?? "").Trim();
            var query = _catalog.Products.AsEnumerable();

            if (!string.IsNullOrWhiteSpace(key))
            {
                query = query.Where(p =>
                    !string.IsNullOrWhiteSpace(p?.Name) &&
                    p.Name.IndexOf(key, StringComparison.OrdinalIgnoreCase) >= 0);
            }

            foreach (var p in query)
                FilteredProducts.Add(p);
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

            // eyni məhsulu təkrar əlavə edəndə birləşdirmək istəyirsənsə,
            // CartService-də Increase/Find logic olmalıdır.
            _cartService.Items.Add(new CartLineItem(product, 1));

            // 1) Haptic feedback
            try { HapticFeedback.Default.Perform(HapticFeedbackType.Click); } catch { }

            // 2) 1 saniyəlik snackbar
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
}
