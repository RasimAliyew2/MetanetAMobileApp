using MetanetA_MobileApp.ViewModels;

namespace MetanetA_MobileApp.View.Gifts;

public partial class GiftDetailPage : ContentPage
{
	public GiftDetailPage(GiftDetailViewModel vm)
	{
		InitializeComponent();
		BindingContext = vm;
	}
}