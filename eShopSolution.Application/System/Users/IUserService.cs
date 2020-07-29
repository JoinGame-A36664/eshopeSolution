using eShopSolution.ViewModels.Common;
using eShopSolution.ViewModels.System.Users;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace eShopSolution.Application.System.Users
{
    public interface IUserService
    {
        Task<string> Authencate(LoginRequest request);

        Task<bool> Register(RegisterRequest request);

        // phương thức lấy tất cả User ra
        Task<PagedResult<UserVm>> GetUserPaging(GetUserPagingRequest request); // phườn thức này lấy ra một user và trả về một model phân trang
    }
}