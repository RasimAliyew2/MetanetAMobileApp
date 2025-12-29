using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http.Headers;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using MetanetA_MobileApp.Model;

namespace MetanetA_MobileApp.Services.GetDataFromServer
{
    public static class GetAndPostAllDataForUser
    {
        private static string Username = "rasim";
        private static string Password = "1";

        public static async Task<string> PostAsyncUserInfo(UserInfo userInfo)
        {
            string url = "http://webrequests.matanata.com/InfoBase/hs/WebRequestForMobileApp/tasks?Type=AddNewUser";
            var data = JsonSerializer.Serialize(userInfo);
            return await PostAsync(url, data);
        }

        public static async Task<string> GetAsyncUserInfo(UserInfo userInfo)
        {
            string url = "http://webrequests.matanata.com/InfoBase/hs/WebRequestForMobileApp/tasks?Type=GetUserInfo";
            var data = JsonSerializer.Serialize(userInfo);
            return await PostAsync(url, data);
        }
        public static async Task<string> PostAsync(string uri, string data,string contentType = "application/json")
        {
            using HttpContent content = new StringContent(data, Encoding.UTF8, contentType);
            HttpClient _client = new HttpClient();
            var token = Convert.ToBase64String(Encoding.UTF8.GetBytes($"{Username}:{Password}"));
            _client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic", token);


            HttpRequestMessage requestMessage = new HttpRequestMessage()
            {
                Content = content,
                Method = HttpMethod.Post,
                RequestUri = new Uri(uri)
            };

            

            try
            {
                using HttpResponseMessage response = await _client.SendAsync(requestMessage);
                return await response.Content.ReadAsStringAsync();
            }
            catch (HttpRequestException ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
                System.Diagnostics.Debug.WriteLine(ex.InnerException?.ToString());
                throw;
            }
        }
        public static async Task<string> GetAsync(string uri, string data, string contentType = "application/json")
        {
            using var client = new HttpClient();
            using HttpContent content = new StringContent(data, Encoding.UTF8, contentType);
            var token = Convert.ToBase64String(Encoding.UTF8.GetBytes($"{Username}:{Password}"));
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic", token);


            HttpRequestMessage requestMessage = new HttpRequestMessage()
            {
                Content = content,
                Method = HttpMethod.Get,
                RequestUri = new Uri(uri)
            };

            try
            {
                using var response = await client.SendAsync(requestMessage);

                return await response.Content.ReadAsStringAsync();
                 
            }
            catch (HttpRequestException ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
                System.Diagnostics.Debug.WriteLine(ex.InnerException?.ToString());
                throw;
            }
        }

    }
}
