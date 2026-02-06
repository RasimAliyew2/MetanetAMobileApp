using MetanetA_MobileApp.ViewModels;
using MetanetA_MobileApp.ViewModels.GiftsViewModels;

namespace MetanetA_MobileApp.View.Gifts;

public partial class GiftsPage : ContentPage
{
	public GiftsPage(GiftsViewModel vm)
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