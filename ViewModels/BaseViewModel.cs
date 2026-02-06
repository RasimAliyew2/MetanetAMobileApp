using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.Services.UIState;
using MetanetA_MobileApp.View;
using MetanetA_MobileApp.View.Gifts;
using MetanetA_MobileApp.View.Products;

namespace MetanetA_MobileApp.ViewModels
{
    public partial class BaseViewModel : ObservableObject
    {
        [ObservableProperty] private BottomMenuState menuState;

        public BaseViewModel(BottomMenuState menuState)
        {
            this.menuState = menuState;
        }
        [RelayCommand]
        public async Task GoTobonusPage()
        {
            await Shell.Current.GoToAsync($"//{nameof(BonusesPage)}");
        }
        [RelayCommand]
        public async Task Qr()
        {
            MenuState.Select(BottomTab.Qr);
            await Shell.Current.GoToAsync(nameof(QrScannerPage));

        }

        [RelayCommand]
        public async Task Home()
        {
            MenuState.Select(BottomTab.Home);
            await Shell.Current.GoToAsync($"//{nameof(MainPage)}");
        }
        [RelayCommand]
        public async Task Profile()
        {
            MenuState.Select(BottomTab.Profile);
            await Shell.Current.GoToAsync($"//{nameof(ProfilePage)}");
        }

        [RelayCommand]
        public async Task Products()
        {
            MenuState.Select(BottomTab.Products);
            await Shell.Current.GoToAsync($"//{nameof(ProductPreSelectedPage)}");
        }
        [RelayCommand]
        public async Task Other()
        {
            MenuState.Select(BottomTab.Other);
            await Shell.Current.GoToAsync($"//{nameof(OthersPage)}");
        }
    
        [RelayCommand]
        public async Task Campaigns()
        {
            // await Shell.Current.GoToAsync($"//{nameof(QrScannerPage)}");
        }

        [RelayCommand]
        public async Task Gifts()
        {
            await Shell.Current.GoToAsync($"//{nameof(GiftsPage)}");
        }
    }
}
