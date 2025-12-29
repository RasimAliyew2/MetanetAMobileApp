using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.Services;
using MetanetA_MobileApp.Services.Abstractions;
using MetanetA_MobileApp.View;

namespace MetanetA_MobileApp.ViewModels
{
    public partial class SignUpViewModel : ObservableObject
    {
        public DateTime MinBirthDate => DateTime.Today.AddYears(-120);
        public DateTime MaxBirthDate => DateTime.Today;

        private IUserSession userSession;


        [ObservableProperty]
        string lineNumber;

        [ObservableProperty]
        private UserInfo userInfo;

        [ObservableProperty]
        public bool isNameValid = true;

        [ObservableProperty]
        private int thicknessBorder = 0;

        [ObservableProperty]
        private string selectedPrefix = "050";
        public ObservableCollection<string> Cities { get; } = new();

        public ObservableCollection<string> Prefixes { get; } = new();
        public ObservableCollection<string> Jobs { get; } = new();
        public SignUpViewModel(IUserSession userSession,UserInfo userInfo)
        {
            this.userInfo = userInfo;
            this.userSession = userSession;
            SetCities();
            SetJobs();
            SetPrefixes();
        }
        public void SetCities()
        {
            Cities.Add("Abşeron");
            Cities.Add("Ağcabədi");
            Cities.Add("Ağdam");
            Cities.Add("Ağdaş");
            Cities.Add("Ağdərə");
            Cities.Add("Ağstafa");
            Cities.Add("Ağsu");
            Cities.Add("Astara");
            Cities.Add("Babək");
            Cities.Add("Balakən");
            Cities.Add("Beyləqan");
            Cities.Add("Bərdə");
            Cities.Add("Biləsuvar");
            Cities.Add("Cəbrayıl");
            Cities.Add("Cəlilabad");
            Cities.Add("Culfa");
            Cities.Add("Daşkəsən");
            Cities.Add("Füzuli");
            Cities.Add("Gədəbəy");
            Cities.Add("Goranboy");
            Cities.Add("Göyçay");
            Cities.Add("Göygöl");
            Cities.Add("Hacıqabul");
            Cities.Add("Xaçmaz");
            Cities.Add("Xızı");
            Cities.Add("Xocalı");
            Cities.Add("Xocavənd");
            Cities.Add("İmişli");
            Cities.Add("İsmayıllı");
            Cities.Add("Kəlbəcər");
            Cities.Add("Kəngərli");
            Cities.Add("Kürdəmir");
            Cities.Add("Qax");
            Cities.Add("Qazax");
            Cities.Add("Qəbələ");
            Cities.Add("Qobustan");
            Cities.Add("Quba");
            Cities.Add("Qubadlı");
            Cities.Add("Qusar");
            Cities.Add("Laçın");
            Cities.Add("Lerik");
            Cities.Add("Lənkəran");
            Cities.Add("Masallı");
            Cities.Add("Neftçala");
            Cities.Add("Oğuz");
            Cities.Add("Ordubad");
            Cities.Add("Saatlı");
            Cities.Add("Sabirabad");
            Cities.Add("Salyan");
            Cities.Add("Samux");
            Cities.Add("Sədərək");
            Cities.Add("Siyəzən");
            Cities.Add("Şabran");
            Cities.Add("Şahbuz");
            Cities.Add("Şamaxı");
            Cities.Add("Şəki");
            Cities.Add("Şəmkir");
            Cities.Add("Şərur");
            Cities.Add("Şuşa");
            Cities.Add("Tərtər");
            Cities.Add("Tovuz");
            Cities.Add("Ucar");
            Cities.Add("Yardımlı");
            Cities.Add("Yevlax");
            Cities.Add("Zaqatala");
            Cities.Add("Zəngilan");
            Cities.Add("Zərdab");
        }
        public void SetJobs()
        {
            Jobs.Add("Malyar");
            Jobs.Add("pol - pataloq");
            Jobs.Add("universal");
        }
        public void SetPrefixes()
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
        public async Task SignUp()
        {
            userInfo.PhoneNumber = selectedPrefix.Replace("+","").Replace(" ","") + lineNumber; 
            if (string.IsNullOrEmpty(userInfo.Name))
            {
                IsNameValid = false;
                ThicknessBorder = 1;
            }
            else
            {
                IsNameValid = true;
                ThicknessBorder = 0;
            }
         
            userSession.OtpCode = await SendEmail.SendSmsAsync(userInfo.PhoneNumber);
            await Shell.Current.GoToAsync($"//{nameof(ConfrimTheSMS)}");
            //await Shell.Current.GoToAsync($"//{nameof(SignInPage)}");
        }
    }
}
