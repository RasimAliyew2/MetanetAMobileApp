using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;

using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services.Abstractions;
using MetanetA_MobileApp.Services.GetDataFromServer;
using MetanetA_MobileApp.View;

namespace MetanetA_MobileApp.ViewModel
{
    public partial class SignInViewModel : ObservableObject
    {
        [ObservableProperty]
        public string username;

        public Bonus UserBonus;

        [ObservableProperty]
        UserInfo userInfo;

        [ObservableProperty]
        bool isVisible;

        public SignInViewModel(UserInfo userInfo)
        {
            this.userInfo = userInfo;
            // username = "test";
        }

        [RelayCommand] 
        public async Task SignIn()
        {
            if (string.IsNullOrEmpty(userInfo.PhoneNumber) || string.IsNullOrEmpty(userInfo.Password))
                return;


            if (!userInfo.PhoneNumber.StartsWith("994"))
                userInfo.PhoneNumber = "994" + userInfo.PhoneNumber.Remove(0,1);
            string json = await GetAndPostAllDataForUser.GetAsyncUserInfo(userInfo);
            if (string.IsNullOrEmpty(json))
            {
                isVisible = true;
            }
            else
            {
                var _userInfo = JsonSerializer.Deserialize<UserInfo>(json);
                await Shell.Current.GoToAsync($"//{nameof(MainPage)}");
            }

        }
        [RelayCommand]
        public async Task SignUp()
        {
            await Shell.Current.GoToAsync($"//{nameof(SignUpPage)}");
        }
    }
}
