using MetanetA_MobileApp.ViewModels.Sales;

namespace MetanetA_MobileApp.View.Sales;

public partial class SalesDetailPage : ContentPage
{
    public SalesDetailPage(SalesDetailViewModel vm)
    {
        InitializeComponent();
        BindingContext = vm;
    }
    protected override bool OnBackButtonPressed()
    {
        MainThread.BeginInvokeOnMainThread(async () =>
        {
            await Shell.Current.GoToAsync($"//{nameof(SalesPage)}");
        });

        return true; // default back işləməsin, app çıxmasın
    }
}