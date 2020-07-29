using eShopSolution.ViewModels.System.Users;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace eShopeSolution.AddminApp.Services
{
    public class UserApiClient : IUserApiClient
    {
        // lại tiêm Di
        private readonly IHttpClientFactory _httpClientFactory;

        public UserApiClient(IHttpClientFactory httpClientFactory)
        {
            _httpClientFactory = httpClientFactory;
        }

        public async Task<string> Authenticate(LoginRequest request)
        {
            // chúng ta phải convert thằng request để chuyền lên nếu ko convert nó sẽ không post lên được
            var json = JsonConvert.SerializeObject(request);
            var httpContent = new StringContent(json, Encoding.UTF8, "application/json");
            // phải AddHttpClient vào startup của AdminAPp nhe
            var client = _httpClientFactory.CreateClient();
            // nhớ phải set lại cổng cho Api là 5001 và UserApp là 5002 để nó không bị trùng cổng nhe     //CẨN THẬN NHẦM CỔNG ĐÉO LẤY ĐƯỢC TOKEN ĐÂU
            client.BaseAddress = new Uri("https://localhost:5001");
            var response = await client.PostAsync("/api/users/authenticate", httpContent);// đưa link vào giống cái đường dẫn trên Swagger vào ở UserController của swagger ý bên project Api

            // lấy token ra để đăng nhập và sử dụng token như bên Swargger để đăng nhập
            var token = await response.Content.ReadAsStringAsync();

            return token;
        }
    }
}