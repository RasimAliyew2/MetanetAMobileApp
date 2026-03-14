using System.Collections.ObjectModel;
using System.Linq;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services.Abstractions;
using MetanetA_MobileApp.Services.UIState;
using MetanetA_MobileApp.View.Gifts;

namespace MetanetA_MobileApp.ViewModels
{
    public partial class BonusesViewModel : BaseViewModel
    {
        [ObservableProperty] private float bonusCollected;
        [ObservableProperty] private float bonusSpent;

        [ObservableProperty] private ProfileBonus profileBonus;

        [ObservableProperty] private IUserSession userSession;

        [ObservableProperty] private float currentBonus;

        private IGiftPurchaseNotifier purchaseNotifier;

        private IQRBonusNotifier QRBonusNotifier;
        public ObservableCollection<BonusTransaction> BonusHistory { get; } = new();

        public BonusesViewModel(IUserSession userSession,ProfileBonus profileBonus, BottomMenuState bottomMenu,
            IGiftPurchaseNotifier giftPurchaseNotifier, 
            IQRBonusNotifier bonusNotifier) : base(bottomMenu)
        {
            this.QRBonusNotifier = bonusNotifier;
            this.QRBonusNotifier.QRBonusAdded += row => AddBonusRow(row);

            purchaseNotifier = giftPurchaseNotifier;
            purchaseNotifier.GiftPurchaseAdded += row => SpendBonusRow(row);

            UserSession = userSession;
            this.ProfileBonus = profileBonus;
            // Əgər sənin real datan varsa buradan götürə bilərsən:
            // BonusCollected = userSession?.CurrentUser?.BonusOfProfile?.CollectedBonus ?? 0;
            // BonusSpent = userSession?.CurrentUser?.BonusOfProfile?.BonusUsed ?? 0;

            // Demo tarixçə (sonra API-dən doldurarsan)
       

            //BonusHistory.Add(new BonusTransaction
            //{
            //    Date = System.DateTime.Today.AddDays(-2),
            //    Type = BonusTransactionType.Spent,
            //    Amount = 10,
            //    Description = "Hədiyyə alındı"
            //});

            //BonusHistory.Add(new BonusTransaction
            //{
            //    Date = System.DateTime.Today.AddDays(-1),
            //    Type = BonusTransactionType.Earned,
            //    Amount = 20,
            //    Description = "Kampaniya bonusu"
            //});

            RecalculateTotals();
        }

        public void SpendBonusRow(BonusTransaction row)
        {
            BonusHistory.Add(new BonusTransaction
            {
                Date = System.DateTime.Today,
                Type = BonusTransactionType.Spent,
                Amount = row.Amount,
                Description = row.Description
            });
            RefreshBonus();
        }
        public void AddBonusRow(BonusTransaction row)
        {
            BonusHistory.Add(new BonusTransaction
            {
                Date = System.DateTime.Today,
                Type = BonusTransactionType.Earned,
                Amount = row.Amount,
                Description = row.Description
            });
            RefreshBonus();
        }
        public void RefreshBonus()
        {
            CurrentBonus = UserSession.CurrentUser.BonusOfProfile.CurrentBonus;
        }
        partial void OnBonusCollectedChanged(float value) => OnPropertyChanged(nameof(CurrentBonus));
        partial void OnBonusSpentChanged(float value) => OnPropertyChanged(nameof(CurrentBonus));


        public void RecalculateTotals()
        {
            BonusCollected = BonusHistory
                .Where(x => x.Type == BonusTransactionType.Earned)
                .Sum(x => x.Amount);

            BonusSpent = BonusHistory
                .Where(x => x.Type == BonusTransactionType.Spent)
                .Sum(x => x.Amount);

            OnPropertyChanged(nameof(CurrentBonus));
        }

        [RelayCommand]
        private async Task ConvertToGift()
        {
            if (CurrentBonus <= 0)
            {
                await App.Current.MainPage.DisplayAlert(
                    "Məlumat",
                    "Hədiyyəyə çevirmək üçün kifayət qədər bonus yoxdur.",
                    "OK");

                return;
            }

    

            // example: hamısını xərclə (demo)
            //BonusHistory.Add(new BonusTransaction
            //{
            //    Date = System.DateTime.Now,
            //    Type = BonusTransactionType.Spent,
            //    Amount = CurrentBonus,
            //    Description = "Hədiyyəyə çevrildi"
            //});

            RecalculateTotals();
            await Shell.Current.GoToAsync($"//{nameof(GiftsPage)}");
        }
    }
}
