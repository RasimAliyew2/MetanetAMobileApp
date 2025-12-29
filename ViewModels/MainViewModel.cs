using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.View;
using MetanetA_MobileApp.View.Gifts;
using MetanetA_MobileApp.View.Products;

namespace MetanetA_MobileApp.ViewModels
{
    public partial class MainViewModel : ObservableObject
    {
        [RelayCommand]
        public async Task GoTobonusPage()
        {
            await Shell.Current.GoToAsync($"//{nameof(BonusesPage)}");
        }
        [RelayCommand]
        public async Task Qr()
        {
            await Shell.Current.GoToAsync($"//{nameof(QrScannerPage)}");
        }
 
        [RelayCommand]
        public async Task Home()
        {
           // await Shell.Current.GoToAsync($"//{nameof(QrScannerPage)}");
        }
        [RelayCommand]
        public async Task Profile()
        {
             await Shell.Current.GoToAsync($"//{nameof(ProfilePage)}");
        }
        
        [RelayCommand]
        public async Task Products()
        {
             await Shell.Current.GoToAsync($"//{nameof(ProductPage)}");
        }
        [RelayCommand]
        public async Task Campaigns()
        {
            // await Shell.Current.GoToAsync($"//{nameof(QrScannerPage)}");
        }
        [RelayCommand]
        public async Task Ads()
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
