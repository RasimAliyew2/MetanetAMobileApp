using MetanetA_MobileApp.ViewModels.ProductsViewModels;

namespace MetanetA_MobileApp.View.Products;

public partial class ProductDetailPage : ContentPage
{
	public ProductDetailPage(ProductDetailViewModel vm)
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