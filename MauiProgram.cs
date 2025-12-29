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
            builder.Services.AddSingleton<QRCodeNotAccepted>();
            builder.Services.AddSingleton<QrCodeAccepted>();

            //View Models
            builder.Services.AddSingleton<MainViewModel>();
            builder.Services.AddSingleton<SignInViewModel>();
            builder.Services.AddSingleton<SignUpViewModel>();
            builder.Services.AddSingleton<SetPasswordViewModel>();
            builder.Services.AddSingleton<BonusesViewModel>();
            builder.Services.AddSingleton<ConfrimSMSViewModel>();
            builder.Services.AddSingleton<QrScannerViewModel>(); 
            builder.Services.AddSingleton<ProfileViewModel>();
            builder.Services.AddSingleton<GiftsViewModel>();
            builder.Services.AddSingleton<ProductViewModel>();
            builder.Services.AddSingleton<GiftDetailViewModel>();
            builder.Services.AddSingleton<QRCodeNotAcceptedViewModel>();
            builder.Services.AddSingleton<QRCodeAcceptedViewModel>(); 
  
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
