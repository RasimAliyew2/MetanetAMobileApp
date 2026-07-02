using System.Collections.ObjectModel;
using System.Linq;
using System.Text.Json;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services;
using MetanetA_MobileApp.Services.Abstractions;
using MetanetA_MobileApp.Services.GetDataFromServer;
using MetanetA_MobileApp.View;

namespace MetanetA_MobileApp.ViewModel
{
    public partial class SignInViewModel : ObservableObject
    {
        public Bonus UserBonus;

        [ObservableProperty]
        private string phoneNumber;

        [ObservableProperty]
        private string lineNumber;

        [ObservableProperty]
        private string selectedPrefix = "+994 50";

        [ObservableProperty]
        private string password;

        [ObservableProperty]
        private bool fillTheArea = false;

        [ObservableProperty]
        private bool invalidCredentials = false;

        [ObservableProperty]
        private bool isPasswordHidden = true;

        [ObservableProperty]
        private bool isConfirmPasswordHidden = true;

        private readonly IUserSession userSession;

        public ObservableCollection<string> Prefixes { get; } = new();

        public string FullPhoneNumber => BuildPhoneNumber();

        public SignInViewModel(IUserSession userSession)
        {
            this.userSession = userSession;
            SetPrefixes();
        }

        partial void OnSelectedPrefixChanged(string value)
            => OnPropertyChanged(nameof(FullPhoneNumber));

        partial void OnLineNumberChanged(string value)
            => OnPropertyChanged(nameof(FullPhoneNumber));

        private string BuildPhoneNumber()
        {
            var prefixDigits = (SelectedPrefix ?? string.Empty)
                .Replace("+", string.Empty)
                .Replace(" ", string.Empty)
                .Trim();

            var lineDigits = new string((LineNumber ?? string.Empty)
                .Where(char.IsDigit)
                .ToArray());

            if (string.IsNullOrWhiteSpace(prefixDigits) &&
                string.IsNullOrWhiteSpace(lineDigits))
                return string.Empty;

            return prefixDigits + lineDigits;
        }

        private void SetPrefixes()
        {
            Prefixes.Add("+994 50");
            Prefixes.Add("+994 51");
            Prefixes.Add("+994 55");
            Prefixes.Add("+994 10");
            Prefixes.Add("+994 60");
            Prefixes.Add("+994 70");
            Prefixes.Add("+994 77");
            Prefixes.Add("+994 99");
        }

        [RelayCommand]
        public async Task SignIn()
        {
            var lineDigits = new string((LineNumber ?? string.Empty)
                .Where(char.IsDigit)
                .ToArray());

            if (string.IsNullOrWhiteSpace(SelectedPrefix) ||
                lineDigits.Length != 7 ||
                string.IsNullOrWhiteSpace(Password))
            {
                FillTheArea = true;
                InvalidCredentials = false;
                return;
            }

            PhoneNumber = AdjustUserInfo.AdjustPhoneNumber(BuildPhoneNumber());

            string text = await GetAndPostAllDataForUser.GetAsyncUserInfo(new UserInfo()
            {
                Password = Password,
                PhoneNumber = PhoneNumber
            });

            if (string.IsNullOrEmpty(text))
            {
                FillTheArea = true;
                InvalidCredentials = false;
            }
            else if (text == "Invalid credentials")
            {
                InvalidCredentials = true;
                FillTheArea = false;
            }
            else
            {
                userSession.CurrentUser = JsonSerializer.Deserialize<UserInfo[]>(text)?[0];
                await Shell.Current.GoToAsync($"//{nameof(MainPage)}");
            }
        }

        [RelayCommand]
        private void TogglePasswordVisibility()
        {
            IsPasswordHidden = !IsPasswordHidden;
        }

        [RelayCommand]
        public async Task SignUp()
        {
            await Shell.Current.GoToAsync($"//{nameof(SignUpPage)}");
        }
    }
}