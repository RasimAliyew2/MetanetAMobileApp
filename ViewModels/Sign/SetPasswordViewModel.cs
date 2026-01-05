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
using MetanetA_MobileApp.Services.GetDataFromServer;
using MetanetA_MobileApp.View;

namespace MetanetA_MobileApp.ViewModels.Sign
{
    [QueryProperty(nameof(OperationType), "OperationType")]
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

        [ObservableProperty]
        private OperationType operationType;



        private IUserSession userSession;
        partial void OnPasswordChanged(string value) => UpdateMismatch();
        partial void OnConfirmPasswordChanged(string value) => UpdateMismatch();

        private void UpdateMismatch()
        {
            // istifadəçi 2-ci sahəyə nəsə yazandan sonra yoxlasın
            IsMismatch = !string.IsNullOrWhiteSpace(ConfirmPassword)
                         && !string.Equals(Password, ConfirmPassword, StringComparison.Ordinal);
        }

        public SetPasswordViewModel(IUserSession userSession)
        {
            this.userSession = userSession;
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

            userSession.CurrentUser.Password = Password;

            if (OperationType == OperationType.SetPassword)
                await SetPassword();
            else if (OperationType == OperationType.ChangePassword)
            {
                userSession.CurrentUser.PhoneNumber = AdjustUserInfo.AdjustPhoneNumber(userSession.CurrentUser.PhoneNumber);
                var text = await GetAndPostAllDataForUser.PostAsyncUserInfoUnique(userSession.CurrentUser, "UpdateUserInfo");
                await Shell.Current.GoToAsync($"//{nameof(SignInPage)}");
            }


        }
        private async Task SetPassword()
        {

            userSession.CurrentUser.PhoneNumber = AdjustUserInfo.AdjustPhoneNumber(userSession.CurrentUser.PhoneNumber);
            var text = await GetAndPostAllDataForUser.PostAsyncUserInfo(userSession.CurrentUser);
            // Shell istifadə edirsənsə:
            await Shell.Current.GoToAsync($"//{nameof(RequestAcceptedPage)}");

        }
    }
}