using System.Collections.Specialized;
using System.ComponentModel;
using System.Linq;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services.Cart;
using MetanetA_MobileApp.Services.UIState;

namespace MetanetA_MobileApp.ViewModels.Sales
{
    public partial class CartViewModel : BaseViewModel
    {
        private readonly CartService cart;

        public System.Collections.ObjectModel.ObservableCollection<CartLineItem> Items => cart.Items;

        [ObservableProperty]
        private bool isEmpty;

        // ✅ Button enable/disable üçün
        public bool HasItems => !IsEmpty;

        [ObservableProperty]
        private bool isOrderPopupVisible;

        public decimal TotalPrice => cart.TotalPrice;
        public int TotalCount => cart.TotalCount;

        public CartViewModel(CartService cart, BottomMenuState menuState) : base(menuState)
        {
            this.cart = cart;

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

            // ✅ bottom badge
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
        private void CompleteOrder()
        {
            if (!cart.Items.Any())
                return;

            // ✅ cart təmizlə (page boş görünsün)
            cart.Clear();
            Refresh();

            // ✅ böyük pop-up göstər
            IsOrderPopupVisible = true;
        }

        [RelayCommand]
        private void DismissOrderPopup()
        {
            IsOrderPopupVisible = false;
        }
    }
}
