using MetanetA_MobileApp.Services.Notifications;

namespace MetanetA_MobileApp
{
    public partial class App : Application
    {
        private readonly IFirebaseNotificationService firebaseNotificationService;

        public App(IFirebaseNotificationService firebaseNotificationService)
        {
            InitializeComponent();
            this.firebaseNotificationService = firebaseNotificationService;
            //MainPage = new AppShell();
        }

        protected override Window CreateWindow(IActivationState? activationState)
        {
            var window = new Window(new AppShell());

            _ = InitializeNotificationsAsync();

            return window;
        }

        private async Task InitializeNotificationsAsync()
        {
            try
            {
                await Task.Delay(500);
                await firebaseNotificationService.InitializeAsync();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Firebase notification initialization failed: {ex}");
            }
        }
    }
}
