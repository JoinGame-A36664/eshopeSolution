
using eShopSolution.ViewModels.Catalog.Common;
using eShopSolution.ViewModels.Catalog.Products;
using eShopSolution.ViewModels.Catalog.Products.Public;  // chỉ ra thằng này để cho nó khác với thằng Manage
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace eShopSolution.Application.Catalog.Products
{
    // cái interface này chỉ chứa các phương thức bên ngoài cho khách hàng 
    public interface IPublicProductService
    {
        //using eShopSolution.ViewModels.Catalog.Products.Public; để cho nó khác với thằng manage nhe vì thằng này có cái tên giống thằng mange
        Task<PagedResult<ProductViewModel>> GetAllByCategoryId(GetProductPagingRequest request); // hiển thị danh sách sản phẩm theo categoryId (thể loại )
    }
}
