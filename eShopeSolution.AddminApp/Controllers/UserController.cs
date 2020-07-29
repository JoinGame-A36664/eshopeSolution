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
    public class UserController : Controller
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
            var sessions = HttpContext.Session.GetString("Token");
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

        // đưa phương thức login lên cho view

        [HttpGet]
        public async Task<IActionResult> Login()
        {
            // vào trang login là ta logout những section(phần) cũ đi
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(LoginRequest request) // add refrence project model vào nhe
        {
            if (!ModelState.IsValid)
                return View(ModelState);

            var token = await _userApiClient.Authenticate(request);  // đó lấy ra được token ở request rồi

            // giải mã token ra
            var userPrincipal = this.ValidateToken(token); // chuyền token sang UserPrincipal
            //https://docs.microsoft.com/en-us/aspnet/core/security/authentication/cookie?view=aspnetcore-3.1
            var authProperties = new AuthenticationProperties // lấy tập Properties của cookies
            {
                ExpiresUtc = DateTimeOffset.UtcNow.AddMinutes(10),
                IsPersistent = true  // là khi đăng nhập rồi mà tắt chương trình nó vẫn đăng nhập khi chạy lại
            };

            HttpContext.Session.SetString("Token", token);  //phải add thêm modul token vào trong startup của project AdminApp

            await HttpContext.SignInAsync(
                    CookieAuthenticationDefaults.AuthenticationScheme,
                    userPrincipal,
                    authProperties);

            return RedirectToAction("Index", "Home");  // đi đến Index trong thư mục Home
        }

        // nhớ cài đặt bên layout thằng action này thì mới logout được nhe
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);// thực hiện Logout
            //phải xóa thằng token đi để nó ko lưu thằng cũ khi đăng nhập lại mà chúng ta sẽ sử dụng token mới khi đăng nhập cũ xóa đi
            HttpContext.Session.Remove("Token"); // 30' Token chưa hết thì Sesstion đã hết

            return RedirectToAction("Login", "User"); // logout song đi đén Login trong thư mục User
        }

        // hàm giải mã token
        private ClaimsPrincipal ValidateToken(string jwToken)
        {
            // vào đây mà đọc
            // https://docs.microsoft.com/en-us/aspnet/core/security/authentication/cookie?view=aspnetcore-3.1
            IdentityModelEventSource.ShowPII = true;

            SecurityToken validatedToken;
            TokenValidationParameters validationParameters = new TokenValidationParameters();

            validationParameters.ValidateLifetime = true;
            // nhớ lấy cái phần Token cảu appSetting Api coppy sang AdminApp nhe
            validationParameters.ValidAudience = _configuration["Tokens:Issuer"];
            validationParameters.ValidIssuer = _configuration["Tokens:Issuer"];
            validationParameters.IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Tokens:Key"]));

            ClaimsPrincipal principal = new JwtSecurityTokenHandler().ValidateToken(jwToken, validationParameters, out validatedToken);
            return principal;
        }
    }
}