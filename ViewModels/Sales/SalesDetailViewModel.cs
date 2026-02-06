using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services.Cart;
using MetanetA_MobileApp.Services.UIState;
using MetanetA_MobileApp.View.Sales;

namespace MetanetA_MobileApp.ViewModels.Sales
{
    [QueryProperty(nameof(Item), "Item")]
    public partial class SalesDetailViewModel : ObservableObject
    {
        private readonly CartService cart;

        [ObservableProperty] private SalesItem item;

        public SalesDetailViewModel(CartService cart)
        {
            this.cart = cart;
        }

        [RelayCommand]
        private async Task AddToCartAsync()
        {
            if (Item == null)
                return;

            cart.Add(Item);

            await Application.Current.MainPage.DisplayAlert(
                "Əlavə edildi",
                "Məhsul səbətə əlavə olundu.",
                "OK");
        }

        [RelayCommand]
        private async Task CancelAsync()
        {
            await Shell.Current.GoToAsync($"//{nameof(SalesPage)}");
        }
    }
}
