using eShopSolution.ViewModels.Catalog.ProductImages;
using eShopSolution.ViewModels.Catalog.Products;
using eShopSolution.ViewModels.Common;
using Microsoft.AspNetCore.Http;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace eShopSolution.Application.Catalog.Products
{
    // cái interface này chỉ chứa các phương thức cho develop
    public  interface IMangeProductService
    {

        // dùng Task để sử dụng Async để dùng được nhiều Request cũng một luc và có thể dúng thread(đa luông)

        Task<int> Create(ProductCreateRequest request); // sử dụng task để trả về một Async

        Task<int> Update(ProductUpdateRequest request); // update dữ liệu

        Task<bool> UpdatePrice(int ProductId, decimal newPrice);
        Task<bool> UpdateStock(int ProductId, int addedQuantity);
        Task AddViewCount(int ProductId);//nếu ko viết kiểu mặc định là void


        Task<int> Delete(int ProductId);// chỉ cần chuyền vào ProductId

        Task<ProductViewModel> GetById(int productId,string languageId);
     

        Task<PagedResult<ProductViewModel>> GetAllPaging(GetMangeProductRequest request);


        // phương thức thêm ảnh vào database
        Task<int> AddImage(int ProductId, ProductImageCreateRequest request);

        Task<int> RemoveImage( int imageId);

        Task<int> UpDateImage( int imageId, ProductImageUpdateRequest request);

        Task<ProductImageViewModel> GetImageById(int imageId);

        Task<List<ProductImageViewModel>> GetListImages(int productId);

    }
}
