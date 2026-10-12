namespace MetanetA_MobileApp
{
    public partial class App : Application
    {
        public App()
        {
            // Keep brand surfaces and native controls consistent on both platforms.
            UserAppTheme = AppTheme.Light;
            InitializeComponent();

            // Firebase notification initialization must NOT run here.
            // On Android, the App constructor can execute before FirebaseApp exists.
        }

        protected override Window CreateWindow(IActivationState? activationState)
        {
            return new Window(new AppShell());
        }
    }
}
