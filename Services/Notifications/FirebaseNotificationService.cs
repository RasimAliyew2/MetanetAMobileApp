using System.Diagnostics;
using System.Threading;

#if ANDROID || IOS
using Plugin.Firebase.CloudMessaging;
#endif

namespace MetanetA_MobileApp.Services.Notifications;

public sealed class FirebaseNotificationService
{
    private int _initializationStarted;

    public async Task InitializeAsync()
    {
#if ANDROID || IOS
        // MainActivity yenidən yaradılsa belə eyni instance daxilində
        // initialization-un iki dəfə paralel başlamasına imkan vermir.
        if (Interlocked.Exchange(ref _initializationStarted, 1) == 1)
            return;

        try
        {
            var cloudMessaging = CrossFirebaseCloudMessaging.Current;

            await cloudMessaging.CheckIfValidAsync();

            var token = await cloudMessaging.GetTokenAsync();

            if (string.IsNullOrWhiteSpace(token))
            {
                Debug.WriteLine("FCM token boş qaytarıldı.");
                return;
            }

            await SecureStorage.Default.SetAsync("fcm_token", token);
            Debug.WriteLine($"FCM TOKEN: {token}");
        }
        catch
        {
            Interlocked.Exchange(ref _initializationStarted, 0);
            throw;
        }
#else
        // Firebase Cloud Messaging bu layihədə yalnız Android/iOS üçündür.
        await Task.CompletedTask;
#endif
    }
}
