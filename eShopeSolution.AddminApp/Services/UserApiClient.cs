using eShopSolution.ViewModels.Common;
using eShopSolution.ViewModels.System.Users;
using Microsoft.AspNetCore.Http;
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

        private readonly IHttpContextAccessor _httpContextAccessor; // sang startup adminApp add  services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
        private readonly IConfiguration _configuration;// đế lấy cấu hình của appsetting devlopment

        public UserApiClient(IHttpClientFactory httpClientFactory, IHttpContextAccessor httpContextAccessor, IConfiguration configuration)
        {
            _httpClientFactory = httpClientFactory;
            _configuration = configuration;
            _httpContextAccessor = httpContextAccessor;
        }

        public async Task<ApiResult<string>> Authenticate(LoginRequest request)
        {
            // chúng ta phải convert thằng request để chuyền lên nếu ko convert nó sẽ không post lên được
            var json = JsonConvert.SerializeObject(request);
            var httpContent = new StringContent(json, Encoding.UTF8, "application/json");
            // phải AddHttpClient vào startup của AdminAPp nhe
            var client = _httpClientFactory.CreateClient();
            // nhớ phải set lại cổng cho Api là 5001 và UserApp là 5002 để nó không bị trùng cổng nhe     //CẨN THẬN NHẦM CỔNG ĐÉO LẤY ĐƯỢC TOKEN ĐÂU
            // lấy cấu hình  Appsetting devlopment trong AdminApp bằng _configuration
            client.BaseAddress = new Uri(_configuration["BaseAddress"]); // đó nó đã lấy được cấu hình của Appsetting devlopment trong AdminApp

            var response = await client.PostAsync("/api/users/authenticate", httpContent);// cái này dùng để đi đến tầng Backend theo đúng đường dẫn chuyền vào

            if (response.IsSuccessStatusCode)
            {
                // lấy token ra để đăng nhập và sử dụng token như bên Swargger để đăng nhập
                return JsonConvert.DeserializeObject<ApiSuccessResult<string>>(await response.Content.ReadAsStringAsync());
            }

            return JsonConvert.DeserializeObject<ApiErrorResult<string>>(await response.Content.ReadAsStringAsync());
        }

        // Delete
        public async Task<ApiResult<bool>> Delete(Guid Id)
        {
            var sessions = _httpContextAccessor.HttpContext.Session.GetString("Token");
            var client = _httpClientFactory.CreateClient();
            client.BaseAddress = new Uri(_configuration["BaseAddress"]);
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", sessions);   // Phải add
            var response = await client.DeleteAsync($"/api/users/{Id}");
            var body = await response.Content.ReadAsStringAsync();
            if (response.IsSuccessStatusCode)
                return JsonConvert.DeserializeObject<ApiSuccessResult<bool>>(body);

            return JsonConvert.DeserializeObject<ApiErrorResult<bool>>(body);
        }

        public async Task<ApiResult<UserVm>> GetById(Guid id)
        {
            var sessions = _httpContextAccessor.HttpContext.Session.GetString("Token");
            var client = _httpClientFactory.CreateClient();
            client.BaseAddress = new Uri(_configuration["BaseAddress"]);
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", sessions);   // Phải add ,nhớ cái khi đăng nhập ở Swagger ta phải thêm Bearer + Token mới đăng nhạp được
            var response = await client.GetAsync($"/api/users/{id}"); // thằng này chạy 5001 là đúng vì nó lấy Bearer token của swagger nằm trong cổng 5001
            var body = await response.Content.ReadAsStringAsync();
            if (response.IsSuccessStatusCode)
                return JsonConvert.DeserializeObject<ApiSuccessResult<UserVm>>(body); //nó convert thằng body sang ApiSuccessResult<UserVm> , nó sẽ tự động lấy các thuộc tinh của tương thích của body

            return JsonConvert.DeserializeObject<ApiErrorResult<UserVm>>(body);
        }

        // lấy ra UserPaging và appsettings.Development của AdminApp sửa
        public async Task<ApiResult<PagedResult<UserVm>>> GetUsersPagings(GetUserPagingRequest request)   // dùng thằng này cho UserController của   GetAllPaging
        {
            // phải AddHttpClient vào startup của AdminAPp nhe
            var client = _httpClientFactory.CreateClient();
            var sessions = _httpContextAccessor.HttpContext.Session.GetString("Token");

            client.BaseAddress = new Uri(_configuration["BaseAddress"]); // đó nó đã lấy được cấu hình của Appsetting devlopment trong AdminApp
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", sessions);

            // đây chính là đường link kết nối với tầng backend nó sẽ đi vào đường link này rồi lấy ra respnse đẻ trả về đây
            var response = await client.GetAsync($"/api/users/paging?pageIndex=" +
                $"{request.PageIndex}&pageSize={request.PageSize}&keyword={request.KeyWord}");// đưa link vào giống cái đường dẫn trên Swagger vào ở UserController của swagger ý bên project Api
                                                                                              // nó sẽ biding vào được vì bên UserController ta đã để fromQuery

            var body = await response.Content.ReadAsStringAsync();
            var users = JsonConvert.DeserializeObject<ApiSuccessResult<PagedResult<UserVm>>>(body);

            return users;
        }

        public async Task<ApiResult<bool>> RegisterUser(RegisterRequest request)
        {
            // phải AddHttpClient vào startup của AdminAPp nhe
            var client = _httpClientFactory.CreateClient();

            client.BaseAddress = new Uri(_configuration["BaseAddress"]);
            var json = JsonConvert.SerializeObject(request);
            var httpContent = new StringContent(json, Encoding.UTF8, "application/json");

            // thằng này chính là đi đến đường link để kết nối với phương thức Register cảu tầng Backend và lấy về response mang về đây sử lý lên tầng frontEnd
            var response = await client.PostAsync($"/api/users", httpContent);
            var result = await response.Content.ReadAsStringAsync();
            if (response.IsSuccessStatusCode)
                return JsonConvert.DeserializeObject<ApiSuccessResult<bool>>(result);
            return JsonConvert.DeserializeObject<ApiErrorResult<bool>>(result);
        }

        // phương thức role cho frontend
        public async Task<ApiResult<bool>> RoleAssign(Guid Id, RoleAssignRequest request)
        {
            var client = _httpClientFactory.CreateClient();
            client.BaseAddress = new Uri(_configuration["BaseAddress"]);
            var sessions = _httpContextAccessor.HttpContext.Session.GetString("Token");

            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", sessions);

            var json = JsonConvert.SerializeObject(request);
            var httpContent = new StringContent(json, Encoding.UTF8, "application/json");

            // đây chính là đường dẫn kết nối với role của tầng Backend và lấy về response mang về đây sử lý tiếp
            var response = await client.PutAsync($"/api/users/{Id}/roles", httpContent);
            var result = await response.Content.ReadAsStringAsync();
            if (response.IsSuccessStatusCode)
                return JsonConvert.DeserializeObject<ApiSuccessResult<bool>>(result);

            return JsonConvert.DeserializeObject<ApiErrorResult<bool>>(result);
        }

        // UpdateUser
        public async Task<ApiResult<bool>> UpdateUser(Guid id, UserUpdateRequest request)
        {
            var client = _httpClientFactory.CreateClient();
            client.BaseAddress = new Uri(_configuration["BaseAddress"]);
            var sessions = _httpContextAccessor.HttpContext.Session.GetString("Token");

            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", sessions);

            var json = JsonConvert.SerializeObject(request);
            var httpContent = new StringContent(json, Encoding.UTF8, "application/json");

            // đây chính là đường dẫn kết nối với Upadate của tầng Backend và lấy về response mang về đây sử lý tiếp
            var response = await client.PutAsync($"/api/users/{id}", httpContent);
            var result = await response.Content.ReadAsStringAsync();
            if (response.IsSuccessStatusCode)
                return JsonConvert.DeserializeObject<ApiSuccessResult<bool>>(result);

            return JsonConvert.DeserializeObject<ApiErrorResult<bool>>(result);
        }
    }
}