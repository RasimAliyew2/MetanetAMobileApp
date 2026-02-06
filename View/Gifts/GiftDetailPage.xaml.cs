using MetanetA_MobileApp.ViewModels;

namespace MetanetA_MobileApp.View.Gifts;

public partial class GiftDetailPage : ContentPage
{
	public GiftDetailPage(GiftDetailViewModel vm)
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