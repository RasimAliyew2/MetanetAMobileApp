using MetanetA_MobileApp.ViewModel;
using MetanetA_MobileApp.ViewModels;

namespace MetanetA_MobileApp.View;



public partial class SignInPage : ContentPage
{
    private bool _notificationPermissionChecked;
    public SignInPage(SignInViewModel vm)
	{
		InitializeComponent();
		BindingContext = vm;
	}
    private async void ForgotPassword_Tapped(object sender, TappedEventArgs e)
    {
        // Sənin unutdum səhifənin adı nədirsə onu yaz
        await Shell.Current.GoToAsync($"//{nameof(ForgetPasswordPage)}");
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();

        if (_notificationPermissionChecked)
            return;

        _notificationPermissionChecked = true;

#if ANDROID
        if (DeviceInfo.Version.Major >= 13)
        {
            var status =
                await Permissions.CheckStatusAsync<Permissions.PostNotifications>();

            if (status != PermissionStatus.Granted)
            {
                status =
                    await Permissions.RequestAsync<Permissions.PostNotifications>();
            }
        }
#endif
    }
}
