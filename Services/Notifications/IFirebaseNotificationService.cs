namespace MetanetA_MobileApp.Services.Notifications;

public interface IFirebaseNotificationService
{
    string? LastToken { get; }

    Task InitializeAsync();

    Task<string?> GetTokenAsync();
}
