using MetanetA_MobileApp.Services;
using MetanetA_MobileApp.Services.Abstractions;
using MetanetA_MobileApp.View;
using MetanetA_MobileApp.ViewModels;
using Microsoft.Extensions.Logging;
using ZXing.Net.Maui.Controls;
using CommunityToolkit.Maui;
using MetanetA_MobileApp.Model;
using MetanetA_MobileApp.ViewModels.QRCode;

using Microsoft.Maui.Handlers;
using MetanetA_MobileApp.View.Gifts;
using MetanetA_MobileApp.View.Products;
using MetanetA_MobileApp.ViewModels.ProductsViewModels;
using MetanetA_MobileApp.ViewModels.Sign;
using MetanetA_MobileApp.View.Sign;
using MetanetA_MobileApp.ViewModel;




#if ANDROID
using AndroidX.AppCompat.Widget;
#endif

namespace MetanetA_MobileApp
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
             .UseMauiApp<App>()
             .UseBarcodeReader()          // ZXing 0.4.0
             .UseMauiCommunityToolkit();

#if ANDROID
        EntryHandler.Mapper.AppendToMapping("NoUnderline", (handler, view) =>
        {
            if (handler.PlatformView is AndroidX.AppCompat.Widget.AppCompatEditText editText)
            {
                // alt xetti verən background-u silirik
                editText.Background = null;
            }
        });
#endif

#if DEBUG
            builder.Logging.AddDebug();
#endif
            //Pages
            builder.Services.AddSingleton<MainPage>();
            builder.Services.AddSingleton<BonusesPage>();
            builder.Services.AddSingleton<SignInPage>(); 
            builder.Services.AddSingleton<SignUpPage>();
            builder.Services.AddSingleton<SetPasswordPage>();
            builder.Services.AddSingleton<ProductPage>();
            builder.Services.AddSingleton<GiftsPage>();
            builder.Services.AddSingleton<GiftDetailPage>();
            builder.Services.AddSingleton<QrScannerPage>();
            builder.Services.AddSingleton<ConfrimTheSMS>(); 
            builder.Services.AddSingleton<ProfilePage>();
            builder.Services.AddSingleton<QrCodeAccepted>();
            builder.Services.AddSingleton<QRCodeNotAccepted>();
            builder.Services.AddSingleton<ForgetPasswordPage>();
            builder.Services.AddSingleton<RequestAcceptedPage>(); 


            //View Models
            builder.Services.AddTransient<MainViewModel>();
            builder.Services.AddTransient<SignInViewModel>();
            builder.Services.AddTransient<SignUpViewModel>();
            builder.Services.AddTransient<SetPasswordViewModel>();
            builder.Services.AddTransient<BonusesViewModel>();
            builder.Services.AddTransient<ConfrimSMSViewModel>();
            builder.Services.AddTransient<QrScannerViewModel>(); 
            builder.Services.AddTransient<ProfileViewModel>();
            builder.Services.AddTransient<GiftsViewModel>();
            builder.Services.AddTransient<ProductViewModel>();
            builder.Services.AddTransient<GiftDetailViewModel>();
            builder.Services.AddTransient<ForgetPasswordViewModel>();
            builder.Services.AddTransient<RequestAcceptedViewModel>();
            builder.Services.AddTransient<QRCodeNotAcceptedViewModel>();
            builder.Services.AddTransient<QRCodeAcceptedViewModel>();
            

            //Services
            builder.Services.AddSingleton<IUserSession, UserSession>();  
            builder.Services.AddSingleton<IQrCode, QrCode>(); 

            //Models
            builder.Services.AddSingleton<IBonus, Bonus>();
            builder.Services.AddSingleton<UserInfo>();
            builder.Services.AddSingleton<ProfileBonus>();
            builder.Services.AddSingleton<IGiftItem, GiftItem>(); 

            return builder.Build();
        }
    }
}
