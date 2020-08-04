using eShopSolution.ViewModels.Catalog.Products;
using eShopSolution.ViewModels.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace eShopeSolution.AddminApp.Services
{
    public interface IProductApiClient
    {
        Task<ApiResult<PagedResult<ProductVm>>> GetProductPagings(GetManageProductPagingRequest request);// để đọc cái Api láy paging của backEnd

        Task<bool> CreateProduct(ProductCreateRequest request);

        Task<int> UpdateProduct(ProductUpdateRequest request); // update dữ liệu

        Task<ProductVm> GetById(int productId, string languageId);
    }
}