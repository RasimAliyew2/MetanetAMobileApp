using System.Collections.ObjectModel;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services.Abstractions;
using MetanetA_MobileApp.Services.UIState;
using MetanetA_MobileApp.View;
using UserInfo = MetanetA_MobileApp.Model.UserInfo;

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

        private IGiftPurchaseNotifier purchaseNotifier;
        private UserInfo userInfo;
        // İstəyirsənsə, rahat binding üçün ayrıca readonly property-lər də aça bilərsən
        public string Name => Gift?.Name;
        public string ImageUrl => Gift?.ImageUrl;
        public float Price => Gift?.Price ?? 0;

        public GiftDetailViewModel(IUserSession userSession, BottomMenuState bottomMenu, IGiftPurchaseNotifier giftPurchaseNotifier) : base(bottomMenu)
        {

            purchaseNotifier = giftPurchaseNotifier;
            this.userInfo = userSession.CurrentUser;
        }
        [RelayCommand]
        public async Task Buy()
        {
            if (userInfo.BonusOfProfile.CurrentBonus > Price)
            {
                userInfo.BonusOfProfile.UsedBonus += Price;
                userInfo.BonusOfProfile.CurrentBonus = userInfo.BonusOfProfile.CurrentBonus - Price;
                purchaseNotifier.PublishNewGiftPurchase(new BonusTransaction
                {
                    Date = System.DateTime.Now,
                    Type = BonusTransactionType.Spent,
                    Amount = Price,
                    Description = $"Bonus hədiyyəyə çevrildi \n alınan hədiyyə:{Name} "
                });

                

                await Application.Current.MainPage.DisplayAlert(
                    "Əlavə edildi",
                    "Hədiyyə sifariş olundu.",
                    "OK");
                await Shell.Current.GoToAsync($"//{nameof(MainPage)}");

            }
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
