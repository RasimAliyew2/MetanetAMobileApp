using Android.App;
using Android.Content;
using Android.Content.PM;
using Android.OS;
using Android.Views;
using Plugin.Firebase.CloudMessaging;
using Plugin.Firebase.CloudMessaging.Platforms.Android;

namespace MetanetA_MobileApp;

[Activity(
    Theme = "@style/Maui.SplashTheme",
    MainLauncher = true,
    LaunchMode = LaunchMode.SingleTop,
    ConfigurationChanges =
        ConfigChanges.ScreenSize |
        ConfigChanges.Orientation |
        ConfigChanges.UiMode |
        ConfigChanges.ScreenLayout |
        ConfigChanges.SmallestScreenSize |
        ConfigChanges.Density,
    WindowSoftInputMode = SoftInput.AdjustResize
)]
public class MainActivity : MauiAppCompatActivity
{
    protected override void OnCreate(Bundle savedInstanceState)
    {
        base.OnCreate(savedInstanceState);

        // bəzi device-lərdə bunu da yazmaq daha stabil edir:
        Window?.SetSoftInputMode(SoftInput.AdjustResize);

        CreateNotificationChannel();
        FirebaseCloudMessagingImplementation.OnNewIntent(Intent);
    }

    protected override void OnNewIntent(Intent intent)
    {
        base.OnNewIntent(intent);
        FirebaseCloudMessagingImplementation.OnNewIntent(intent);
    }

    private static void CreateNotificationChannel()
    {
        if (Build.VERSION.SdkInt < BuildVersionCodes.O)
            return;

        var appContext = global::Android.App.Application.Context;

        var channelId = $"{appContext.PackageName}.general";

        var notificationManager =
            (NotificationManager?)appContext.GetSystemService(global::Android.Content.Context.NotificationService);

        if (notificationManager is null)
            return;

        var channel = new NotificationChannel(
            channelId,
            "General",
            NotificationImportance.Default)
        {
            Description = "General app notifications"
        };

        notificationManager.CreateNotificationChannel(channel);
    }
}
