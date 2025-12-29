using MetanetA_MobileApp.ViewModels.QRCode;

namespace MetanetA_MobileApp.View;

public partial class QrCodeAccepted : ContentPage
{
	public QrCodeAccepted(QRCodeAcceptedViewModel vm)
	{
		InitializeComponent();
		BindingContext = vm;
	}
}