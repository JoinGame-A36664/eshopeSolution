using eShopSolution.ViewModels.Catalog.Common;
using System;
using System.Collections.Generic;
using System.Text;

namespace eShopSolution.ViewModels.Catalog.Products.Manage
{
    public class GetProductPagingRequest : PagingRequestBase
    {
        public string KeyWord { get; set; }

        public List<int> CategoryIds { get; set; }  // ta có thể chuền vào một mảng để tìm kiếm cũng được 
    }
}
