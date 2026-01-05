using MetanetA_MobileApp.ViewModels;

namespace MetanetA_MobileApp.View;

public partial class SignUpPage : ContentPage
{
	public SignUpPage(SignUpViewModel vm)
	{
		InitializeComponent();
		BindingContext = vm;
	}
    protected override bool OnBackButtonPressed()
    {
        MainThread.BeginInvokeOnMainThread(async () =>
        {
            await Shell.Current.GoToAsync($"//{nameof(SignInPage)}");
        });

        return true; // default back işləməsin, app çıxmasın
    }
}