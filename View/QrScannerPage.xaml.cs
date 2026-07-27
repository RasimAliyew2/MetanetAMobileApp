using MetanetA_MobileApp.ViewModels;

namespace MetanetA_MobileApp.View;

public partial class QrScannerPage : ContentPage
{
    public QrScannerPage(QrScannerViewModel vm)
    {
        InitializeComponent();
        BindingContext = vm;
    }

    protected override bool OnBackButtonPressed()
    {
        MainThread.BeginInvokeOnMainThread(async () =>
        {
            if (BindingContext is QrScannerViewModel vm)
                await vm.Home();
        });

        return true;
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();

        var status = await Permissions.CheckStatusAsync<Permissions.Camera>();

        if (status != PermissionStatus.Granted)
            status = await Permissions.RequestAsync<Permissions.Camera>();

        if (status != PermissionStatus.Granted)
        {
            await DisplayAlert("Kamera icazəsi", "QR kodu skan etmək üçün kamera icazəsi verilməlidir.", "OK");
            return;
        }

        MainThread.BeginInvokeOnMainThread(() =>
        {
            Scanner.IsEnabled = true;
            Scanner.IsDetecting = true;
        });
    }

    protected override void OnDisappearing()
    {
        if (Scanner is not null)
        {
            Scanner.IsDetecting = false;
            Scanner.IsEnabled = false;
        }

        base.OnDisappearing();
    }
}
