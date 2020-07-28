
using eShopSolution.ViewModels.Catalog.Common;
using eShopSolution.ViewModels.Catalog.Products;
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


     

        Task<PagedResult<ProductViewModel>> GetAllPaging(GetMangeProductRequest request);


        // phương thức thêm ảnh vào database
        Task<int> AddImages(int ProductId,List<IFormFile>files);

        Task<int> RemoveImages(int imageId);

        Task<int> UpDateImage(int imageId, string caption, bool isDefault);

        Task<List<ProductImageViewModel>> GetListImage(int productId);

    }
}
