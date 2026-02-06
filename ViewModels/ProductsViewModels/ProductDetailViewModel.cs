using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services.UIState;
using MetanetA_MobileApp.View;

namespace MetanetA_MobileApp.ViewModels.ProductsViewModels
{
    [QueryProperty(nameof(ProductItem), "ProductItem")]
    public partial class ProductDetailViewModel : BaseViewModel
    {
        // Bütün məlumatı saxlayan obyekt
        [ObservableProperty]
        public ProductItem productItem;

        [ObservableProperty]
        public bool isVisible;
        private UserInfo userInfo;
        // İstəyirsənsə, rahat binding üçün ayrıca readonly property-lər də aça bilərsən
        public string Name => ProductItem?.Name;
        public string ImageUrl => ProductItem?.ImageUrl;
        public float Price => ProductItem?.Price ?? 0;

        // Əgər GiftItem-də Description əlavə etsən:
        // public string Description => Gift?.Description;
        public ProductDetailViewModel(UserInfo userInfo, BottomMenuState bottomMenu) : base(bottomMenu)
        {
            this.userInfo = userInfo;
        }
    
        [RelayCommand]
        public async Task Buy()
        {
            if (userInfo.BonusOfProfile.CurrentBonus > Price)
                await Shell.Current.GoToAsync($"//{nameof(MainPage)}");
            else
                IsVisible = true;

        }
        [RelayCommand]
        public async Task Decline()
        {
            await Shell.Current.GoToAsync($"//{nameof(MainPage)}");
        }
    }
}

