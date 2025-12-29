using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services.GetDataFromServer;
using MetanetA_MobileApp.View;

namespace MetanetA_MobileApp.ViewModels.Sign
{
    public partial class SetPasswordViewModel : ObservableObject
    {
        [ObservableProperty]
        private string password;

        [ObservableProperty]
        private string confirmPassword;

        [ObservableProperty]
        private bool isMismatch;

        [ObservableProperty]
        private string mismatchText = "uyğun gəlmir";

        private UserInfo userInfo;
        partial void OnPasswordChanged(string value) => UpdateMismatch();
        partial void OnConfirmPasswordChanged(string value) => UpdateMismatch();

        private void UpdateMismatch()
        {
            // istifadəçi 2-ci sahəyə nəsə yazandan sonra yoxlasın
            IsMismatch = !string.IsNullOrWhiteSpace(ConfirmPassword)
                         && !string.Equals(Password, ConfirmPassword, StringComparison.Ordinal);
        }

        public SetPasswordViewModel(UserInfo userInfo)
        {
            this.userInfo = userInfo;
        }

        [RelayCommand]
        private async Task ConfirmAsync()
        {
            UpdateMismatch();

            if (IsMismatch)
                return;

            // boş olmasın deyə istəsən bu şərti də əlavə et:
            if (string.IsNullOrWhiteSpace(Password) || string.IsNullOrWhiteSpace(ConfirmPassword))
            {
                IsMismatch = true;
                MismatchText = "parol boş ola bilməz";
                return;
            }

            userInfo.Password = Password;

            await GetAndPostAllDataForUser.PostAsyncUserInfo(userInfo);
            // Shell istifadə edirsənsə:
            await Shell.Current.GoToAsync($"//{nameof(SignInPage)}");

            // Əgər Shell yoxdursa (NavigationPage):
            // await Application.Current.MainPage.Navigation.PushAsync(new SignInPage());
        }
    }
}