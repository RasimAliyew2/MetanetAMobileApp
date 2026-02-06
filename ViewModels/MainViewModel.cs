using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.Services.Cart;
using MetanetA_MobileApp.Services.UIState;
using MetanetA_MobileApp.View;
using MetanetA_MobileApp.View.Sales;

namespace MetanetA_MobileApp.ViewModels
{
    public partial class MainViewModel : BaseViewModel
    {
        [ObservableProperty]
        public CartState cart;


        [ObservableProperty]
        public CartService cartService;


        public MainViewModel(BottomMenuState menuState, CartState cart,CartService cartService) : base(menuState)
        {
            Cart = cart;
            CartService = cartService;
        }

        [RelayCommand]
        public async Task OpenCart()
        {
            await Shell.Current.GoToAsync($"//{nameof(CartPage)}");
        }

        [RelayCommand]
        public async Task Shop()
        {
            await Shell.Current.GoToAsync($"//{nameof(SalesPage)}");
        }

        [RelayCommand]
        public async Task Training()
        {
            await Shell.Current.GoToAsync($"//{nameof(VideosPage)}");
        }

        [RelayCommand]
        public async Task Ads()
        {
            await Shell.Current.GoToAsync($"//{nameof(VideosPage)}");
        }
    }
}
