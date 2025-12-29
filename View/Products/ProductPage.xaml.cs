using MetanetA_MobileApp.ViewModels.ProductsViewModels;

namespace MetanetA_MobileApp.View.Products;

public partial class ProductPage : ContentPage
{
	public ProductPage(ProductViewModel vm)
	{
		InitializeComponent();
		BindingContext = vm;
	}
}