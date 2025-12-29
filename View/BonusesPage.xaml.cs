using MetanetA_MobileApp.ViewModels;

namespace MetanetA_MobileApp.View;

public partial class BonusesPage : ContentPage
{
	public BonusesPage(BonusesViewModel vm)
	{
		InitializeComponent();
		BindingContext = vm;
	}

    protected override bool OnBackButtonPressed()
    {
        MainThread.BeginInvokeOnMainThread(async () =>
        {
            await Shell.Current.GoToAsync($"//{nameof(MainPage)}");
        });

        return true; // default back işləməsin, app çıxmasın
    }
}