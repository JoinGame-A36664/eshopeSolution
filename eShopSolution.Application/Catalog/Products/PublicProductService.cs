
using eShopSolution.Data.EF;
using System.Collections.Generic;
using System.Threading.Tasks;

using System.Linq;
using Microsoft.EntityFrameworkCore;
using eShopSolution.ViewModels.Catalog.Products;
using eShopSolution.ViewModels.Common;

namespace eShopSolution.Application.Catalog.Products
{
    public class PublicProductService : IPublicProductService
    {
        // hiện tại là đang sử dụng theo DI đã được học ở khóa cơ bản rồi nha


        // đây là đang sử dụng cách 1 bên DI nhe mở khóa cơ bản ra mà xem
        private readonly EShopDBContext _context;// thằng này có tác dụng kết nối với database để ta thực hiện các chức năng bên dưới
        public PublicProductService(EShopDBContext context) // phải refrnece từ tầng data để lấy EShopDBContext
        {
            _context = context; // thằng Di nó sẽ tự tiêm vào đây cho chúng ta và 
        }

        //// lấy tất cả sản phẩm
        //public async Task<List<ProductViewModel>> GetAll(string languageId)
        //{
        //    var query = from p in _context.Products
        //                join pt in _context.ProductTranslations
        //                on p.Id equals pt.ProductId
        //                join pic in _context.ProductInCategories on p.Id equals pic.ProductId
        //                join c in _context.Categories on pic.CategoryId equals c.Id
        //                where pt.LanguageId == languageId
        //                select new { p, pt, pic };

        //    var data = await query
        //       .Select(x => new ProductViewModel()
        //       {
        //           Id = x.p.Id,
        //           Name = x.pt.Name,
        //           DateCreated = x.p.DateCreated,
        //           Description = x.pt.Description,
        //           Details = x.pt.Details,
        //           LanguageId = x.pt.LanguageId,
        //           OriginalPrice = x.p.OriginalPrice,
        //           Price = x.p.Price,
        //           SeoAlias = x.pt.SeoAlias,
        //           SeoDescription = x.pt.SeoDescription,
        //           SeoTitle = x.pt.SeoTitle,
        //           Stock = x.p.Stock,
        //           ViewCount = x.p.ViewCount

        //       }).ToListAsync();

        //    return data;
        //}

        // using eShopSolution.ViewModels.Catalog.Products.Public; để cho nó khác với thằng Mangae
        public async Task<PagedResult<ProductViewModel>> GetAllByCategoryId(string languageId,GetPublicProductPagingRequest request) // lấy của public nhe
        {
            // bước 1 :select join
            var query = from p in _context.Products
                        join pt in _context.ProductTranslations
                        on p.Id equals pt.ProductId
                        join pic in _context.ProductInCategories on p.Id equals pic.ProductId
                        join c in _context.Categories on pic.CategoryId equals c.Id
                        where pt.LanguageId== languageId
                        select new { p, pt, pic };
            // bước 1: filter theo điều kiện

            if (request.CategoryId.HasValue && request.CategoryId.Value > 0)// HasValue mặc đinh là true
            {
                // using System.linq
                query = query.Where(p => p.pic.CategoryId == request.CategoryId);//một trong só nhữ thằng này thì mới được

            }
            // bước 3: paging
            int totalRow = await query.CountAsync(); // lấy ra tông số số dòng để phân trang   phải include using Microsoft.EntityFrameworkCore;
            var data = await query.Skip((request.PageIndex - 1) * request.PageSize)
                .Take(request.PageSize)// nếu PageIndex=2 và PageSize=20 thì bỏ qua 10 chỉ lấy 10 bẩn ghi hiện lên ko lấy tất để phù hợp với PageSize
                .Select(x => new ProductViewModel()
                {
                    Id = x.p.Id,
                    Name = x.pt.Name,
                    DateCreated = x.p.DateCreated,
                    Description = x.pt.Description,
                    Details = x.pt.Details,
                    LanguageId = x.pt.LanguageId,
                    OriginalPrice = x.p.OriginalPrice,
                    Price = x.p.Price,
                    SeoAlias = x.pt.SeoAlias,
                    SeoDescription = x.pt.SeoDescription,
                    SeoTitle = x.pt.SeoTitle,
                    Stock = x.p.Stock,
                    ViewCount = x.p.ViewCount

                }).ToListAsync(); // vì ta Async ở đây nên trên kia ta chỉ cần await để đẩy vào data là song  nhớ là ToListAsync nha vì bên PageRsult Item ta để là list
                                  // bước 4: selecet and Project
            var pagedResult = new PagedResult<ProductViewModel>()
            {
                TotalRecord = totalRow,
                Item = data

            };
            return pagedResult;
        }
    }
}
