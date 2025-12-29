using MetanetA_MobileApp.ViewModels;

namespace MetanetA_MobileApp.View.Gifts;

public partial class GiftsPage : ContentPage
{
	public GiftsPage(GiftsViewModel vm)
	{
		InitializeComponent();

		BindingContext = vm;
	}
}