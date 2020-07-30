using eShopSolution.ViewModels.Common;
using eShopSolution.ViewModels.System.Users;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eShopeSolution.AddminApp.Services
{
    public interface IUserApiClient
    {
        Task<ApiResult<string>> Authenticate(LoginRequest request);

        Task<ApiResult<PagedResult<UserVm>>> GetUsersPagings(GetUserPagingRequest request);

        Task<ApiResult<bool>> UpdateUser(Guid id, UserUpdateRequest request);

        Task<ApiResult<bool>> RegisterUser(RegisterRequest request);

        Task<ApiResult<UserVm>> GetById(Guid id);
    }
}