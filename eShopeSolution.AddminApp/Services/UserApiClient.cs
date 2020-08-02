using eShopSolution.AdminApp.Services;
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
    public class UserApiClient : BaseApiClient, IUserApiClient
    {
        // lại tiêm Di
        private readonly IHttpClientFactory _httpClientFactory;

        public UserApiClient(IHttpClientFactory httpClientFactory, IHttpContextAccessor httpContextAccessor, IConfiguration configuration)
            : base(httpClientFactory, httpContextAccessor, configuration)
        {
        }

        public async Task<ApiResult<string>> Authenticate(LoginRequest request)
        {
            var data = await PostAsync<ApiResult<string>>("/api/users/authenticate", request);

            return data;
        }

        // Delete
        public async Task<ApiResult<bool>> Delete(Guid Id)
        {
            var data = await DeleteAsync<ApiResult<bool>>($"/api/users/{Id}");

            return data;
        }

        // lấy Id
        public async Task<ApiResult<UserVm>> GetById(Guid id)
        {
            var data = await GetAsync<ApiResult<UserVm>>($"/api/users/{id}");
            return data;
        }

        // lấy ra UserPaging và appsettings.Development của AdminApp sửa
        public async Task<ApiResult<PagedResult<UserVm>>> GetUsersPagings(GetUserPagingRequest request)   // dùng thằng này cho UserController của   GetAllPaging
        {
            var data = await GetAsync<ApiResult<PagedResult<UserVm>>>($"/api/users/paging?pageIndex=" +
                $"{request.PageIndex}&pageSize={request.PageSize}&keyword={request.KeyWord}");
            return data;
        }

        // đăng kí người dùng
        public async Task<ApiResult<bool>> RegisterUser(RegisterRequest request)
        {
            var data = await PostAsync<ApiResult<bool>>("/api/users", request);

            return data;
        }

        // phương thức role cho frontend
        public async Task<ApiResult<bool>> RoleAssign(Guid Id, RoleAssignRequest request)
        {
            var data = await PutAsync<ApiResult<bool>>($"/api/users/{Id}/roles", request);
            return data;
        }

        // UpdateUser
        public async Task<ApiResult<bool>> UpdateUser(Guid id, UserUpdateRequest request)
        {
            var data = await PutAsync<ApiResult<bool>>($"/api/users/{id}", request);
            return data;
        }
    }
}