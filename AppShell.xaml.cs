using MetanetA_MobileApp.View;
using MetanetA_MobileApp.View.Map;

namespace MetanetA_MobileApp
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();
            Routing.RegisterRoute(nameof(QrScannerPage), typeof(QrScannerPage));
            Routing.RegisterRoute(nameof(LocationFoldersPage), typeof(LocationFoldersPage));
            Routing.RegisterRoute(nameof(LocationListPage), typeof(LocationListPage));
            Routing.RegisterRoute(nameof(LocationMapPage), typeof(LocationMapPage));

        }
    }
}
