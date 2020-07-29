using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using eShopeSolution.AddminApp.Services;
using eShopSolution.ViewModels.System.Users;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Logging;
using Microsoft.IdentityModel.Tokens;

namespace eShopeSolution.AddminApp.Controllers
{
    public class UserController : BaseController  // đương nhiên nó sẽ chạy vào BaseController trước check rồi mới suống dưới thực hiện vì kế thừa song mới suống dưới
    {
        // tiếm tục tiêm Di
        private readonly IUserApiClient _userApiClient;

        private readonly IConfiguration _configuration;

        public UserController(IUserApiClient userApiClient, IConfiguration configuration)
        {
            _userApiClient = userApiClient;
            _configuration = configuration;
        }

        public async Task<IActionResult> Index(string keyword, int pageIndex = 1, int pageSize = 10) // gán mặc định nếu không có giá trị nào ,pageSize được tính rồi nhe
        {
            //phải add 1 view là viewName Index ,Template List ,Model class UserVm , use Layout chúng có sẵn tải về

            // pageIndex và pageSize lấy trên query nhe
            var sessions = HttpContext.Session.GetString("Token");  // thằng này cần thận null khi chưa đăng nhập nhe phải tạo ra cái đẻ check tất cả là BaseController
            //từ Token này ta phải ra một cái Request
            var request = new GetUserPagingRequest()
            {
                BearerToken = sessions,
                PageIndex = pageIndex,
                PageSize = pageSize,
                KeyWord = keyword
            };
            var data = await _userApiClient.GetUsersPagings(request);
            return View(data);
        }

        // đăng kí tài khoản biding từ
        [HttpGet]
        public IActionResult Create()
        {
            // tạo View với View Name : Create , Template Create ,Model là RegisterRequest và layout dùng chung
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(RegisterRequest request)
        {
            if (!ModelState.IsValid)
                return View();
            var result = await _userApiClient.RegisterUser(request);
            if (result)
                return RedirectToAction("Index");  // nếu thành công thì chuyển tới phân trang là Index
            return View(request);//nếu ko thành công ta chả về request để xem request
        }

        // nhớ cài đặt bên layout thằng action này thì mới logout được nhe
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);// thực hiện Logout
            //phải xóa thằng token đi để nó ko lưu thằng cũ khi đăng nhập lại mà chúng ta sẽ sử dụng token mới khi đăng nhập cũ xóa đi
            HttpContext.Session.Remove("Token"); // 30' Token chưa hết thì Sesstion đã hết

            return RedirectToAction("Login", "User"); // logout song đi đén Login trong thư mục User
        }
    }
}