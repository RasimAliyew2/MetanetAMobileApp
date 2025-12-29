using MetanetA_MobileApp.View.Gifts;
using MetanetA_MobileApp.ViewModels;

namespace MetanetA_MobileApp.View;

public partial class QrScannerPage : ContentPage
{
    public QrScannerPage(QrScannerViewModel vm)
    {
        InitializeComponent();
        BindingContext = vm;
        //Resources.Add("FirstBarcodeValueConverter", new Converters.FirstBarcodeValueConverter());
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
