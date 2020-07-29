using eShopSolution.ViewModels.Common;
using System;
using System.Collections.Generic;
using System.Text;

namespace eShopSolution.ViewModels.System.Users
{
    public class GetUserPagingRequest : PagingRequestBase  // kế thừa để lấy thêm các thuộc tính pageindex và pageSize
    {
        public string KeyWord { get; set; } // tìm kiếm theo KeyWord
    }
}