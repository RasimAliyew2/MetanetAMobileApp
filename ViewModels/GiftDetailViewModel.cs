using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services.Abstractions;
using MetanetA_MobileApp.Services.UIState;
using MetanetA_MobileApp.View;

namespace MetanetA_MobileApp.ViewModels
{
    [QueryProperty(nameof(Gift), "Gift")]
    public partial class GiftDetailViewModel : BaseViewModel
    {
        // Bütün məlumatı saxlayan obyekt
        [ObservableProperty]
        public GiftItem gift;

        [ObservableProperty]
        public bool isVisible;
        private UserInfo userInfo;
        // İstəyirsənsə, rahat binding üçün ayrıca readonly property-lər də aça bilərsən
        public string Name => Gift?.Name;
        public string ImageUrl => Gift?.ImageUrl;
        public float Price => Gift?.Price ?? 0;

        // Əgər GiftItem-də Description əlavə etsən:
        // public string Description => Gift?.Description;
        public GiftDetailViewModel(UserInfo userInfo, BottomMenuState bottomMenu) : base(bottomMenu)
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
