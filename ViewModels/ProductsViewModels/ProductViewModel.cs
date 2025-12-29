using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.View;
using MetanetA_MobileApp.View.Products;

namespace MetanetA_MobileApp.ViewModels.ProductsViewModels
{
    public partial class ProductViewModel : ObservableObject
    {
        public ObservableCollection<ProductItem> Products { get; }

        private ProductItem selectedGift;
        public ProductItem SelectedGift
        {
            get => selectedGift;
            set
            {
                if (SetProperty(ref selectedGift, value))
                {
                    OnSelectedGiftChanged();
                }
            }
        }

        private async void OnSelectedGiftChanged()
        {
            if (SelectedGift is null)
                return;

            await Shell.Current.GoToAsync("//GiftDetailPage", new Dictionary<string, object>
            {
                { "Gift", SelectedGift }
            });
        }

        public ProductViewModel()
        {

            Products = new ObservableCollection<ProductItem>
            {
                new ProductItem { Name = "Termos", Price = 25, ImageUrl = "product.png" },
                new ProductItem { Name = "Maşın", Price = 1000, ImageUrl = "product.png" }
            };
        }

        // BU metodu özün yazırsan – seçilən item dəyişəndə avtomatik çağırılacaq

        [RelayCommand]
        public async Task Qr()
        {
            await Shell.Current.GoToAsync($"//{nameof(QrScannerPage)}");
        }

        [RelayCommand]
        public async Task Home()
        {
            await Shell.Current.GoToAsync($"//{nameof(MainPage)}");
        }
        [RelayCommand]
        public async Task Profile()
        {
            await Shell.Current.GoToAsync($"//{nameof(ProfilePage)}");
        }

    }
}
