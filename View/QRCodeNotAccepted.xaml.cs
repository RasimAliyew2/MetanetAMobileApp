using MetanetA_MobileApp.ViewModels;

namespace MetanetA_MobileApp.View;
public partial class QRCodeNotAccepted : ContentPage   // ContentPage
{
    public QRCodeNotAccepted(QRCodeNotAcceptedViewModel notAccepted)
    {
        InitializeComponent();
        BindingContext = notAccepted;
    }
}
