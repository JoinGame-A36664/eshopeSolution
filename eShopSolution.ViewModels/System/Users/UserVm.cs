using System;
using System.Collections.Generic;
using System.Text;

namespace eShopSolution.ViewModels.System.Users
{
    public class UserVm
    {
        // muốn show ra gì thì ch nó vào viewModel  điều đó là hiển nhiên product chúng ta cũng làm như thees

        public Guid Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public string PhoneNumber { get; set; }

        public string UserName { get; set; }

        public string Email { get; set; }
    }
}