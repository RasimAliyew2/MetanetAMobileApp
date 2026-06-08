using System.Collections.Specialized;
using System.ComponentModel;
using System.Linq;
using System.Text.Json;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services.Abstractions;
using MetanetA_MobileApp.Services.Cart;
using MetanetA_MobileApp.Services.GetDataFromServer;
using MetanetA_MobileApp.Services.Sales;
using MetanetA_MobileApp.Services.UIState;
using MetanetA_MobileApp.View.Orders;
using MetanetA_MobileApp.View.Sales;

namespace MetanetA_MobileApp.ViewModels.Sales
{
    public partial class CartViewModel : BaseViewModel
    {
        private readonly CartService cart;
        private readonly OrdersService ordersService;

        public System.Collections.ObjectModel.ObservableCollection<CartLineItem> Items => cart.Items;

        [ObservableProperty]
        private bool isEmpty;

        public bool HasItems => !IsEmpty;
        private UserInfo userInfo;

        [ObservableProperty]
        private bool isOrderPopupVisible;

        public decimal TotalPrice => cart.TotalPrice;
        public int TotalCount => cart.TotalCount;

        public CartViewModel(
            CartService cart,
            BottomMenuState menuState,
            IUserSession userSession,
            OrdersService ordersService) : base(menuState)
        {
            this.cart = cart;
            this.ordersService = ordersService;
            this.userInfo = userSession.CurrentUser;

            Refresh();

            cart.Items.CollectionChanged += Items_CollectionChanged;

            foreach (var item in cart.Items)
                item.PropertyChanged += Item_PropertyChanged;
        }

        private void Items_CollectionChanged(object sender, NotifyCollectionChangedEventArgs e)
        {
            if (e.NewItems != null)
                foreach (CartLineItem item in e.NewItems)
                    item.PropertyChanged += Item_PropertyChanged;

            if (e.OldItems != null)
                foreach (CartLineItem item in e.OldItems)
                    item.PropertyChanged -= Item_PropertyChanged;

            Refresh();
        }

        private void Item_PropertyChanged(object sender, PropertyChangedEventArgs e)
        {
            if (e.PropertyName == nameof(CartLineItem.Quantity))
                Refresh();
        }

        private void Refresh()
        {
            IsEmpty = !cart.Items.Any();

            OnPropertyChanged(nameof(HasItems));
            OnPropertyChanged(nameof(TotalPrice));
            OnPropertyChanged(nameof(TotalCount));

            MenuState.CartCount = TotalCount;
        }

        [RelayCommand]
        private void Increase(CartLineItem item)
        {
            cart.Increase(item);
            Refresh();
        }

        [RelayCommand]
        private void Decrease(CartLineItem item)
        {
            cart.Decrease(item);
            Refresh();
        }

        [RelayCommand]
        private void ClearCart()
        {
            cart.Clear();
            Refresh();
        }

        [RelayCommand]
        private async Task CompleteOrder()
        {
            if (!cart.Items.Any())
                return;

            var jsonCart = JsonSerializer.Serialize(cart);
            string text = await GetAndPostAllDataForUser.PostAsync(
                "http://webrequests.matanata.com/InfoBase/hs/WebRequestForMobileApp/tasks?Type=SendEmail",
                jsonCart);

            // Əvvəl sifarişi Orders-ə əlavə et
            ordersService.AddOrderFromCart(cart);

            // Sonra səbəti təmizlə
            cart.Clear();
            Refresh();

            // Orders səhifəsinə keç
            await Shell.Current.GoToAsync($"//{nameof(OrdersPage)}");
        }

        [RelayCommand]
        private void DismissOrderPopup()
        {
            IsOrderPopupVisible = false;
        }
    }
}