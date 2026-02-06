using System.Collections.ObjectModel;
using System.Linq;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services.Abstractions;
using MetanetA_MobileApp.Services.UIState;

namespace MetanetA_MobileApp.ViewModels
{
    public partial class BonusesViewModel : BaseViewModel
    {
        [ObservableProperty] private float bonusCollected;
        [ObservableProperty] private float bonusSpent;

        [ObservableProperty] private ProfileBonus profileBonus;

        [ObservableProperty] private IUserSession userSession;

        public float CurrentBonus => ProfileBonus.CollectedBonus - ProfileBonus.UsedBonus;

        public ObservableCollection<BonusTransaction> BonusHistory { get; } = new();

        public BonusesViewModel(IUserSession userSession,ProfileBonus profileBonus, BottomMenuState bottomMenu) : base(bottomMenu)
        {
            UserSession = userSession;
            this.ProfileBonus = profileBonus;
            // Əgər sənin real datan varsa buradan götürə bilərsən:
            // BonusCollected = userSession?.CurrentUser?.BonusOfProfile?.CollectedBonus ?? 0;
            // BonusSpent = userSession?.CurrentUser?.BonusOfProfile?.BonusUsed ?? 0;

            // Demo tarixçə (sonra API-dən doldurarsan)
            //BonusHistory.Add(new BonusTransaction
            //{
            //    Date = System.DateTime.Today.AddDays(-3),
            //    Type = BonusTransactionType.Earned,
            //    Amount = 30,
            //    Description = "Alış-veriş bonusu"
            //});

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

            await App.Current.MainPage.DisplayAlert(
                "Uğurlu",
                "Bonus hədiyyəyə çevrildi.",
                "OK");

            // example: hamısını xərclə (demo)
            BonusHistory.Add(new BonusTransaction
            {
                Date = System.DateTime.Now,
                Type = BonusTransactionType.Spent,
                Amount = CurrentBonus,
                Description = "Hədiyyəyə çevrildi"
            });

            RecalculateTotals();
        }
    }
}
