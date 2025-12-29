using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.View;

namespace MetanetA_MobileApp.ViewModels.QRCode
{
    public partial class QRCodeAcceptedViewModel : ObservableObject
    {
        [RelayCommand]
        public async Task GoToMainPage()
        {
            await Shell.Current.GoToAsync($"//{nameof(MainPage)}");
        }
    }
}
