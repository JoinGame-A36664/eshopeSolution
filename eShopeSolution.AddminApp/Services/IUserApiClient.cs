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
        Task<ApiResult<string>> Authenticate(LoginRequest request);// để đọc cái Api Delete của backEnd

        Task<ApiResult<PagedResult<UserVm>>> GetUsersPagings(GetUserPagingRequest request);// để đọc cái Api Delete của backEnd

        Task<ApiResult<bool>> UpdateUser(Guid id, UserUpdateRequest request);// để đọc cái Api Delete của backEnd

        Task<ApiResult<bool>> RegisterUser(RegisterRequest request);// để đọc cái Api Delete của backEnd

        Task<ApiResult<UserVm>> GetById(Guid id);// để đọc cái Api Delete của backEnd

        Task<ApiResult<bool>> Delete(Guid Id);  // để đọc cái Api Delete của backEnd
    }
}