#if ANDROID || IOS
using Plugin.Firebase.CloudMessaging;
#endif

namespace MetanetA_MobileApp.Services.Notifications;

public sealed class FirebaseNotificationService : IFirebaseNotificationService
{
    private bool initialized;

    public string? LastToken { get; private set; }

    public async Task InitializeAsync()
    {
#if ANDROID || IOS
        if (initialized)
            return;

        initialized = true;

        CrossFirebaseCloudMessaging.Current.TokenChanged += async (_, _) =>
        {
            await RefreshTokenAsync();
        };

        CrossFirebaseCloudMessaging.Current.NotificationReceived += (_, _) =>
        {
            System.Diagnostics.Debug.WriteLine("Firebase notification received.");
        };

        CrossFirebaseCloudMessaging.Current.NotificationTapped += (_, _) =>
        {
            System.Diagnostics.Debug.WriteLine("Firebase notification tapped.");
        };

        await CrossFirebaseCloudMessaging.Current.CheckIfValidAsync();
        await RefreshTokenAsync();
#else
        initialized = true;
        await Task.CompletedTask;
#endif
    }

    public async Task<string?> GetTokenAsync()
    {
#if ANDROID || IOS
        if (!initialized)
            await InitializeAsync();

        return LastToken;
#else
        await Task.CompletedTask;
        return null;
#endif
    }

#if ANDROID || IOS
    private async Task RefreshTokenAsync()
    {
        try
        {
            LastToken = await CrossFirebaseCloudMessaging.Current.GetTokenAsync();

            if (!string.IsNullOrWhiteSpace(LastToken))
            {
                await SecureStorage.Default.SetAsync("fcm_token", LastToken);
                System.Diagnostics.Debug.WriteLine($"FCM token: {LastToken}");
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"Could not get FCM token: {ex}");
        }
    }
#endif
}
