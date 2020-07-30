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

        public async Task<IActionResult> Index(string keyword, int pageIndex = 1, int pageSize = 10) // gán mặc định nếu không có giá trị nào ,pageSize được tính rồi nhe tính cho phân trang
        {
            //phải add 1 view là viewName Index ,Template List ,Model class UserVm , use Layout chúng có sẵn tải về

            //từ Token này ta phải ra một cái Request
            var request = new GetUserPagingRequest()
            {
                PageIndex = pageIndex,
                PageSize = pageSize,
                KeyWord = keyword
            };
            var data = await _userApiClient.GetUsersPagings(request);
            return View(data.ResultObj);
        }

        [HttpGet]
        public async Task<IActionResult> Details(Guid Id) // lấy ra Id nhớ Index cũng phải có Id nhe
        {
            // add View với View Name= Details , Template=Details , Model class=UserVm , và layout dùng chung

            var result = await _userApiClient.GetById(Id);
            return View(result.ResultObj);
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
            if (result.IsSuccessed)
                return RedirectToAction("Index");  // nếu thành công thì chuyển tới phân trang là Index

            ModelState.AddModelError("", result.Message);// Message trên Api nó chuyền suống được
            return View(request);//nếu ko thành công ta chả về request để xem request
        }

        [HttpGet]
        public async Task<IActionResult> Edit(Guid id)// lấy ra Id nhớ Index cũng phải có Id nhe
        {
            //add view : ViewName=Edit Template=Edit ModelClass= UserUpdate  chọn layout chung

            var result = await _userApiClient.GetById(id); //nhớ viết thêm getById bên thằng UserController của Api
            if (result.IsSuccessed)
            {
                var user = result.ResultObj;
                var updateRequest = new UserUpdateRequest()
                {
                    Dob = user.Dob,
                    Email = user.Email,
                    FirstName = user.FirstName,
                    LastName = user.LastName,
                    PhoneNumber = user.PhoneNumber,
                    Id = id
                };
                return View(updateRequest); // nếu thành công thì chả về đối tượng User được update luân
            }
            return RedirectToAction("Error", "Home"); // nếu không trả về trang Error của Home
        }

        [HttpPost]
        public async Task<IActionResult> Edit(UserUpdateRequest request)
        {
            if (!ModelState.IsValid)
                return View();

            var result = await _userApiClient.UpdateUser(request.Id, request);
            if (result.IsSuccessed)
                return RedirectToAction("Index");

            ModelState.AddModelError("", result.Message);  // đây là lỗi của Model này
            return View(request);
        }

        // nhớ cài đặt bên layout thằng action này thì mới logout được nhe
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);// thực hiện Logout
            //phải xóa thằng token đi để nó ko lưu thằng cũ khi đăng nhập lại mà chúng ta sẽ sử dụng token mới khi đăng nhập cũ xóa đi
            HttpContext.Session.Remove("Token"); // 30' Token chưa hết thì Sesstion đã hết

            return RedirectToAction("Login", "User"); // logout song đi đén Login trong thư mục User
        }

        // delete user
        [HttpGet]
        public IActionResult Delete(Guid id)
        {
            return View(new UserDeleteRequest()
            {
                Id = id,
            });
        }

        [HttpPost]
        public async Task<IActionResult> Delete(UserDeleteRequest request)  // lấy request từ thằng backeEnd thông qua thằng UserApiClient
        {
            if (!ModelState.IsValid)
                return View();
            var result = await _userApiClient.Delete(request.Id);
            if (result.IsSuccessed)
                return RedirectToAction("Index");  // nếu thành công thì chuyển tới phân trang là Index

            ModelState.AddModelError("", result.Message);// Message trên Api nó chuyền suống được
            return View(request);//nếu ko thành công ta chả về request để xem request
        }
    }
}