using Android.App;
using Android.Content;
using Android.Content.PM;
using Android.OS;
using Android.Views;
using Plugin.Firebase.CloudMessaging;
using Plugin.Firebase.Core.Platforms.Android;
using System.Diagnostics;

namespace MetanetA_MobileApp;

[Activity(
    Theme = "@style/Maui.SplashTheme",
    MainLauncher = true,
    ConfigurationChanges =
        ConfigChanges.ScreenSize |
        ConfigChanges.Orientation |
        ConfigChanges.UiMode |
        ConfigChanges.ScreenLayout |
        ConfigChanges.SmallestScreenSize |
        ConfigChanges.Density,
    WindowSoftInputMode = SoftInput.AdjustResize)]
public class MainActivity : MauiAppCompatActivity
{
    protected override void OnCreate(Bundle? savedInstanceState)
    {
        base.OnCreate(savedInstanceState);

        Window?.SetSoftInputMode(SoftInput.AdjustResize);

        // Bu fayl Platforms/Android altında olduğu üçün yalnız Android-də
        // compile olunur. Firebase token sorğusundan əvvəl initialize edilir.
        CrossFirebase.Initialize(this);

        CreateNotificationChannel();
        FirebaseCloudMessagingImplementation.OnNewIntent(Intent);

        _ = GetAndStoreFcmTokenSafelyAsync();
    }

    protected override void OnNewIntent(Intent? intent)
    {
        base.OnNewIntent(intent);

        if (intent is not null)
            FirebaseCloudMessagingImplementation.OnNewIntent(intent);
    }

    private static async Task GetAndStoreFcmTokenSafelyAsync()
    {
        try
        {
           // Debug.WriteLine("FCM: token sorğusu başladı.");

            var cloudMessaging = CrossFirebaseCloudMessaging.Current;
            await cloudMessaging.CheckIfValidAsync();

            var token = await cloudMessaging.GetTokenAsync();

            if (string.IsNullOrWhiteSpace(token))
            {
                //Debug.WriteLine("FCM: token boş qaytarıldı.");
                return;
            }

            await SecureStorage.Default.SetAsync("fcm_token", token);
            //Debug.WriteLine($"FCM TOKEN: {token}");
        }
        catch (Exception ex)
        {
           // Debug.WriteLine($"FCM ERROR: {ex}");
        }
    }

    private void CreateNotificationChannel()
    {
        if (Build.VERSION.SdkInt < BuildVersionCodes.O)
            return;

        var channelId = $"{PackageName}.general";
        var notificationManager =
            (NotificationManager?)GetSystemService(
                global::Android.Content.Context.NotificationService);

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
        FirebaseCloudMessagingImplementation.ChannelId = channelId;
    }
}
