using MetanetA_MobileApp.ViewModels.Sales;

namespace MetanetA_MobileApp.View.Sales;

public partial class CartPage : ContentPage
{
    public CartPage(CartViewModel vm)
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