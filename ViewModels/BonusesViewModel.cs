using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services;
using MetanetA_MobileApp.Services.Abstractions;
using MetanetA_MobileApp.View;
using MetanetA_MobileApp.View.Products;

namespace MetanetA_MobileApp.ViewModels
{
    public partial class BonusesViewModel : ObservableObject
    {
        // Total collected bonus
        [ObservableProperty]
        private float bonusCollected;

        // Total spent bonus
        [ObservableProperty]
        private float bonusSpent;


        [ObservableProperty]
        private IUserSession userSession;
        // Current bonus (collected - spent)
        public float CurrentBonus => BonusCollected - BonusSpent;

        public BonusesViewModel(UserInfo userInfo,IUserSession userSession)
        {
            // For now some demo values; later you can load from UserInfo or API.
            BonusCollected = 120;
            BonusSpent = 35;
            this.userSession = userSession;
        }


        [RelayCommand]
        private async Task ConvertToGift()
        {
            // TODO: implement conversion logic (API call, etc.)
            // Example: deduct some bonus and show dialog
            if (CurrentBonus <= 0)
            {
                await Application.Current.MainPage.DisplayAlert(
                    "Info",
                    "You don't have enough bonus to convert.",
                    "OK");
                return;
            }

            await Application.Current.MainPage.DisplayAlert(
                "Success",
                "Your bonus has been converted to a gift.",
                "OK");

            // Example: mark all bonus as spent
            BonusSpent += CurrentBonus;
        }
        [RelayCommand]
        public async Task Qr()
        {
            await BottomMenuFunctions.Qr();
        }

        [RelayCommand]
        public async Task Home()
        {
            await BottomMenuFunctions.Home();
        }

        [RelayCommand]
        public async Task Products()
        {
            await Shell.Current.GoToAsync($"//{nameof(ProductPage)}");
        }
        [RelayCommand]
        public async Task Profile()
        {
             await Shell.Current.GoToAsync($"//{nameof(ProfilePage)}");
        }
    }
}
