using MetanetA_MobileApp.ViewModel;
using MetanetA_MobileApp.ViewModels;

namespace MetanetA_MobileApp.View;



public partial class SignInPage : ContentPage
{
    public SignInPage(SignInViewModel vm)
	{
		InitializeComponent();
		BindingContext = vm;
	}
}