using System.Net.Http.Headers;
using System.Text;
using System.Text.Json;
using MetanetA_MobileApp.Model;

namespace MetanetA_MobileApp.Services.GetDataFromServer;

public static class GetAndPostAllDataForUser
{
    private static string Username = "rasim";
    private static string Password = "1";

    public static async Task<string> PostAsyncUserInfo(UserInfo userInfo)
    {
        const string url =
            "http://webrequests.matanata.com/InfoBase/hs/WebRequestForMobileApp/tasks?Type=AddNewUser";

        var data = JsonSerializer.Serialize(userInfo);
        return await PostAsync(url, data);
    }

    public static async Task<string> PostAsyncUserInfoUnique(
        UserInfo userInfo,
        string type)
    {
        var url =
            "http://webrequests.matanata.com/InfoBase/hs/WebRequestForMobileApp/tasks?Type=" +
            type;

        var data = JsonSerializer.Serialize(userInfo);
        return await PostAsync(url, data);
    }

    public static async Task<string> GetAsyncUserInfo(UserInfo userInfo)
    {
        const string url =
            "http://webrequests.matanata.com/InfoBase/hs/WebRequestForMobileApp/tasks?Type=GetUserInfo";

        var data = JsonSerializer.Serialize(userInfo);
        return await PostAsync(url, data);
    }

    public static async Task<string> PostAsync(
        string uri,
        string data,
        string contentType = "application/json")
    {
        using HttpContent content =
            new StringContent(data, Encoding.UTF8, contentType);

        using var client = CreateAuthenticatedClient();

        using var requestMessage = new HttpRequestMessage
        {
            Content = content,
            Method = HttpMethod.Post,
            RequestUri = new Uri(uri)
        };

        try
        {
            using var response =
                await client.SendAsync(requestMessage);

            return await response.Content.ReadAsStringAsync();
        }
        catch (Exception ex)
        {
            var message = ex.ToString();

            await MainThread.InvokeOnMainThreadAsync(() =>
                Shell.Current.DisplayAlert("HTTP ERROR", message, "OK"));

            throw;
        }
    }

    // Köhnə GET metodu başqa kodların pozulmaması üçün saxlanılıb.
    public static async Task<string> GetAsync(
        string uri,
        string data,
        string contentType = "application/json")
    {
        using HttpContent content =
            new StringContent(data, Encoding.UTF8, contentType);

        using var client = CreateAuthenticatedClient();

        using var requestMessage = new HttpRequestMessage
        {
            Content = content,
            Method = HttpMethod.Get,
            RequestUri = new Uri(uri)
        };

        try
        {
            using var response =
                await client.SendAsync(requestMessage);

            return await response.Content.ReadAsStringAsync();
        }
        catch (HttpRequestException ex)
        {
            System.Diagnostics.Debug.WriteLine(ex);
            System.Diagnostics.Debug.WriteLine(ex.InnerException);
            throw;
        }
    }

    // Products API üçün body-siz, düzgün GET request.
    public static async Task<string> GetAsync(
        string uri,
        CancellationToken cancellationToken)
    {
        using var client = CreateAuthenticatedClient();

        try
        {
            using var response =
                await client.GetAsync(uri, cancellationToken);

            var responseText =
                await response.Content.ReadAsStringAsync(cancellationToken);

            if (!response.IsSuccessStatusCode)
            {
                throw new HttpRequestException(
                    $"GET {uri} uğursuz oldu. " +
                    $"Status: {(int)response.StatusCode} " +
                    $"{response.ReasonPhrase}. " +
                    $"Response: {responseText}");
            }

            return responseText;
        }
        catch (HttpRequestException ex)
        {
            System.Diagnostics.Debug.WriteLine(ex);
            System.Diagnostics.Debug.WriteLine(ex.InnerException);
            throw;
        }
    }

    private static HttpClient CreateAuthenticatedClient()
    {
        var client = new HttpClient
        {
            Timeout = TimeSpan.FromSeconds(60)
        };

        var token = Convert.ToBase64String(
            Encoding.UTF8.GetBytes($"{Username}:{Password}"));

        client.DefaultRequestHeaders.Authorization =
            new AuthenticationHeaderValue("Basic", token);

        client.DefaultRequestHeaders.Accept.Add(
            new MediaTypeWithQualityHeaderValue("application/json"));

        return client;
    }
}
