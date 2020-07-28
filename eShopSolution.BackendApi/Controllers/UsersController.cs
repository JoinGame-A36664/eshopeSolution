using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using eShopSolution.Application.System.Users;
using eShopSolution.ViewModels.System.Users;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace eShopSolution.BackendApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        // bắt đâu tiêm Di nhớ đăng kí bên startup của APi nhe

        private readonly IUserService _userService;

        public UsersController(IUserService userService)
        {
            _userService = userService;
        }

        // BẮT ĐẦU THỰC HIỆN CÁC PHƯƠNG THỨC CỦA USER

        [HttpPost("authenticate")]
        [AllowAnonymous] // chưa đăng nhập vẫn gọi được cái này
        public async Task<IActionResult> Authencate([FromForm] LoginRequest request)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);
            var resultToken = await _userService.Authencate(request);
            if (string.IsNullOrEmpty(resultToken))
            {
                return BadRequest("Username or password is incorrect");
            }

            return Ok(new { token = resultToken });
        }

        [HttpPost("Register")]
        [AllowAnonymous] // chưa đăng nhập vẫn gọi được cái này
        public async Task<IActionResult> Register([FromForm] RegisterRequest request)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);
            var result = await _userService.Register(request);
            if (!result)
            {
                return BadRequest("Regisster is unsuccessful");
            }

            return Ok();
        }
    }
}