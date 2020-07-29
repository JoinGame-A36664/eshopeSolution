using eShopSolution.ViewModels.Common;
using eShopSolution.ViewModels.System.Users;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace eShopeSolution.AddminApp.Services
{
    public class UserApiClient : IUserApiClient
    {
        // lại tiêm Di
        private readonly IHttpClientFactory _httpClientFactory;

        private readonly IConfiguration _configuration;// đế lấy cấu hình của appsetting devlopment

        public UserApiClient(IHttpClientFactory httpClientFactory, IConfiguration configuration)
        {
            _httpClientFactory = httpClientFactory;
            _configuration = configuration;
        }

        public async Task<string> Authenticate(LoginRequest request)
        {
            // chúng ta phải convert thằng request để chuyền lên nếu ko convert nó sẽ không post lên được
            var json = JsonConvert.SerializeObject(request);
            var httpContent = new StringContent(json, Encoding.UTF8, "application/json");
            // phải AddHttpClient vào startup của AdminAPp nhe
            var client = _httpClientFactory.CreateClient();
            // nhớ phải set lại cổng cho Api là 5001 và UserApp là 5002 để nó không bị trùng cổng nhe     //CẨN THẬN NHẦM CỔNG ĐÉO LẤY ĐƯỢC TOKEN ĐÂU
            // lấy cấu hình  Appsetting devlopment trong AdminApp bằng _configuration
            client.BaseAddress = new Uri(_configuration["BaseAddress"]); // đó nó đã lấy được cấu hình của Appsetting devlopment trong AdminApp
            var response = await client.PostAsync("/api/users/authenticate", httpContent);// đưa link vào giống cái đường dẫn trên Swagger vào ở UserController của swagger ý bên project Api

            // lấy token ra để đăng nhập và sử dụng token như bên Swargger để đăng nhập
            var token = await response.Content.ReadAsStringAsync();

            return token;
        }

        // lấy ra UserPaging và appsettings.Development của AdminApp sửa
        public async Task<PagedResult<UserVm>> GetUsersPagings(GetUserPagingRequest request)   // dùng thằng này cho UserController của   GetAllPaging
        {
            // phải AddHttpClient vào startup của AdminAPp nhe
            var client = _httpClientFactory.CreateClient();

            client.BaseAddress = new Uri(_configuration["BaseAddress"]); // đó nó đã lấy được cấu hình của Appsetting devlopment trong AdminApp
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", request.BearerToken);
            var response = await client.GetAsync($"/api/users/paging?pageIndex=" +
                $"{request.PageIndex}&pageSize={request.PageSize}&keyword={request.KeyWord}");// đưa link vào giống cái đường dẫn trên Swagger vào ở UserController của swagger ý bên project Api
                                                                                              // nó sẽ biding vào được vì bên UserController ta đã để fromQuery

            var body = await response.Content.ReadAsStringAsync();
            var users = JsonConvert.DeserializeObject<PagedResult<UserVm>>(body);

            return users;
        }
    }
}