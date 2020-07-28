using System;
using System.Collections.Generic;
using System.Text;

// khi login các Request từ database sẽ được kéo nên
namespace eShopSolution.ViewModels.System.Users
{
    public class LoginRequest
    {
        public string UserName { get; set; }

        public string Password { get; set; }

        public bool RememberMe { get; set; }
    }
}