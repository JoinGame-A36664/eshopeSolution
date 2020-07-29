using eShopSolution.Data.Entities;
using eShopSolution.ViewModels.System.Users;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace eShopSolution.Application.System.Users
{
    public class UserService : IUserService
    {
        //UserManager và SignInManager nằm trong thư viện using Microsoft.AspNetCore.Identity;
        // phải config bên Startup của project Api nha như kiểu Di ý

        private readonly UserManager<AppUser> _userManager;
        private readonly SignInManager<AppUser> _signInManager;
        private readonly RoleManager<AppRole> _roleManager;
        private readonly IConfiguration _config;

        public UserService(UserManager<AppUser> userManager, SignInManager<AppUser> signInManager, RoleManager<AppRole> roleManager, IConfiguration config)
        {
            _signInManager = signInManager;
            _userManager = userManager;
            _roleManager = roleManager;
            _config = config;
        }

        public async Task<string> Authencate(LoginRequest request) // xác thực đăng nhập
        {
            var user = await _userManager.FindByNameAsync(request.UserName);
            if (user == null)
                return null;

            var result = await _signInManager.PasswordSignInAsync(user, request.Password, request.RememberMe, true); // bằng true là cùa lockoutOnfilure là khi login nhiều quá ta sẽ khóa tài khoản lại
            if (!result.Succeeded)// NẾU đăng nhập thành công
            {
                return null;
            }
            var roles = await _userManager.GetRolesAsync(user); // lấy một list role của user
            var claims = new[] //claims yêu cầu trả lại
            {
                new Claim(ClaimTypes.GivenName,user.FirstName),
                 new Claim(ClaimTypes.Email,user.Email),
                 new Claim(ClaimTypes.Role,string.Join(";",roles)), // string.Join là nối tất cả các dối dượng lại thành một chuối cách nhau bới giấu ;
                 new Claim(ClaimTypes.Name,request.UserName)
            };

            // bắt đầu mã hóa Claim bằng Symmetric vào appseting của Api cài đặt

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Tokens:Key"]));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(_config["Tokens:Issuer"],
                _config["Tokens:Issuer"],
                claims,
                expires: DateTime.Now.AddHours(3),
                signingCredentials: creds);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        // đăng kí user
        public async Task<bool> Register(RegisterRequest request)
        {
            var user = new AppUser()
            {
                DOB = request.DOB,
                Email = request.Email,
                FirstName = request.FirstName,
                LastName = request.LastName,
                UserName = request.UserName,
                PhoneNumber = request.PhoneNumber
            };

            var rusult = await _userManager.CreateAsync(user, request.Password);
            if (rusult.Succeeded)
            {
                return true;
            }
            return false;
        }
    }
}