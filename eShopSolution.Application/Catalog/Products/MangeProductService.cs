using eShopeSolution.Utilities.Exceptions;
using eShopSolution.Application.Common;
using eShopSolution.Data.EF;
using eShopSolution.Data.Entities;
using eShopSolution.ViewModels.Catalog.Common;
using eShopSolution.ViewModels.Catalog.Products;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Threading.Tasks;

namespace eShopSolution.Application.Catalog.Products
{
    public class MangeProductService : IMangeProductService
    {

        // hiện tại là đang sử dụng theo DI đã được học ở khóa cơ bản rồi nha


        // đây là đang sử dụng cách 1 bên DI nhe mở khóa cơ bản ra mà xem
        private readonly EShopDBContext _context;// thằng này có tác dụng kết nối với database để ta thực hiện các chức năng bên dưới

        private readonly IStorageService _storageService;

        public MangeProductService(EShopDBContext context, IStorageService storageService) // phải refrnece từ tầng data để lấy EShopDBContext
        {
            _context = context; // thằng Di nó sẽ tự tiêm vào đây cho chúng ta và 

            // tiêm thằng storService
            _storageService = storageService;

        }



        // Addviewcount theo id của Product
        public async Task AddViewCount(int ProductId)
        {
            var Product = await _context.Products.FindAsync(ProductId);
            Product.ViewCount += 1;
            await _context.SaveChangesAsync();
        }

        // tạo ra sản phẩm theo từng request chuyền vào
        public async Task<int> Create(ProductCreateRequest request) // lấy của Manage nhe
        {
            // tạo một đối tượng
            var product = new Product()
            {
                // phần của Product
                Price = request.Price,
                OriginalPrice = request.OriginalPrice,
                Stock = request.Stock,
                ViewCount = 0,
                DateCreated = DateTime.Now,

                // phần của ProductTranslations
                ProductTranslations = new List<ProductTranslation>()
                {
                    new ProductTranslation()
                    {
                        Name=request.Name,
                        Description=request.Description,
                        Details=request.Details,
                        SeoAlias=request.SeoAlias,
                        SeoDescription=request.SeoDescription,
                        SeoTitle=request.SeoTitle,
                        LanguageId=request.LanguageId
                    }
                }


            };
            // thêm ảnh cho sản phẩm

            if (request.ThumbnailImage != null)
            {
                product.ProductImages = new List<ProductImage>()
                {
                    new ProductImage()
                    {
                        Caption="Thumbnail image",
                        DateCreated=DateTime.Now,
                        FileSize=request.ThumbnailImage.Length,
                        ImagePath= await this.SaveFile(request.ThumbnailImage),
                        Isdefault=true,
                        SortOrder=1

                    }
                };
            }



            _context.Products.Add(product);
            // save bất đồng bộ nó sẽ được đa luồng nên có thể sử lý được nhiều Request cùng một lúc
            return await _context.SaveChangesAsync(); // thay vì chờ Save song nó có thể nhả ra và thực hiện Request khác cùng một lúc 

        }




        // xóa Product theo Id
        public async Task<int> Delete(int ProductId)
        {
            // xóa sản phẩm phải xóa cả ảnh của sản phẩm đấy vd: ta có Iphone7 mà xóa đi tất nhiên trong dữ liệu không được còn ảnh cảu iphone7

            // đây là xóa sản phẩm chứ không phải là số số lượng sản phẩm nhe


            var Product = await _context.Products.FindAsync(ProductId);
            if (Product == null) throw new EShopeException($"Cannot find a Product :{ProductId}");  // tạo một Project class Exception



            // tìm xem có thằng nào giống thứ muốn xóa không // nhơ phải xóa ảnh trước rồi mới xóa sản phẩm
            var images = _context.ProductImages.Where(x => x.ProductId == ProductId); // tất cả những ảnh có ProductId = Id của sản phẩm cần xóa thì ta sẽ xóa tấ vì một sản phẩm có nhiều ảnh
            foreach (var image in images)
            {
                await _storageService.DeleteFileAsync(image.ImagePath);
            }

            // xóa ảnh song ta xóa sản phẩm
            _context.Products.Remove(Product);

            return await _context.SaveChangesAsync();
        }





        // phân trang
        public async Task<PagedResult<ProductViewModel>> GetAllPaging(GetMangeProductRequest request)
        {
            // bước 1 :select join
            var query = from p in _context.Products
                        join pt in _context.ProductTranslations
                        on p.Id equals pt.ProductId
                        join pic in _context.ProductInCategories on p.Id equals pic.ProductId
                        join c in _context.Categories on pic.CategoryId equals c.Id
                        where pt.Name.Contains(request.KeyWord)
                        select new { p, pt, pic };
            // bước 3: filter theo điều kiện
            if (!string.IsNullOrEmpty(request.KeyWord))
                query = query.Where(x => x.pt.Name.Contains(request.KeyWord));
            if (request.CategoryIds.Count > 0)// có nghĩa là có tất cả các tìm kiếm nào
            {
                query = query.Where(p => request.CategoryIds.Contains(p.pic.CategoryId));//một trong só nhữ thằng này thì mới được

            }
            // bước 3: paging
            int totalRow = await query.CountAsync(); // lấy ra tông số số dòng để phân trang
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



        // lấy tất cả các hình có ProductId
        public async Task<List<ProductImageViewModel>> GetListImage(int productId)
        {

            var query = from pi in _context.ProductImages
                     join pd in _context.Products
                     on pi.ProductId equals pd.Id
                     select new { pi };
            var data = await query
               .Select(x => new ProductImageViewModel()
               {
                   FilePath=x.pi.ImagePath,
                   FileSize=x.pi.FileSize,
                   Id=x.pi.Id,
                   IsDefault=x.pi.Isdefault,
                   

               }).ToListAsync();

            return data;
        }



        public async Task<int> RemoveImages(int imageId)
        {
            // có trường hợp sản phẩm ko có ảnh nên chỉ cần xóa ảnh ko cần xóa sản phẩm   , một ảnh chỉ dành cho 1 sản phẩm 

            var image = await _context.ProductImages.FindAsync(imageId);
            if (image == null) throw new EShopeException($"Cannot find a image :{ imageId }");

            _context.ProductImages.Remove(image);

            return await _context.SaveChangesAsync();

        }

        public async Task<int> AddImages(int ProductId, List<IFormFile> files) //add image vào danh sách ProductImage và của sản phẩm này ko cần add vào ProductImage của sản phẩm vì nó đã tham chiếu nên ta add thẳng vào database
        {
            var product = await _context.Products.FindAsync(ProductId); // chỉ cần có sản phẩm phù hợp thì ta được add danh sách ảnh
            if (product == null) throw new EShopeException($"Cannot find a Product has id:{ProductId}");
            for (int i = 0; i < files.Count(); i++)
            {
                var productImage = new ProductImage()
                {
                    ProductId = ProductId,
                    Caption = "Thumbnail image",
                    DateCreated = DateTime.Now,
                    FileSize = files[i].Length,
                    ImagePath = await this.SaveFile(files[i]),
                    Isdefault = true,
                    SortOrder = 1

                };

                _context.ProductImages.Add(productImage);

            }

            return await _context.SaveChangesAsync();




        }

        public async Task<int> UpDateImage(int imageId, string caption, bool isDefault)
        {
            // tìm thằng image
            var productImage = await _context.ProductImages.FindAsync(imageId);
            if (productImage == null) throw new EShopeException($"Cannot find Image has id:{imageId}");

            _context.ProductImages.Find(imageId).Caption = caption;
            _context.ProductImages.Find(imageId).Isdefault = isDefault;

            return await _context.SaveChangesAsync();



        }




        // bắt đầu Update vào  bảng ProductTransalation còn Product chỉ để query thôi
        public async Task<int> Update(ProductUpdateRequest request)
        {
            var product = await _context.Products.FindAsync(request.Id);
            var productTranslation = await _context.ProductTranslations.FirstOrDefaultAsync(
                x => x.ProductId == request.Id &&
                x.LanguageId == request.LanguageId);// chúng ta chỉ sửa cho đúng 1 loại ngông ngữ
            if (product == null || productTranslation == null) throw new EShopeException($"Cannot find a Product with id :{request.Id}");

            productTranslation.Name = request.Name;
            productTranslation.SeoAlias = request.SeoAlias;
            productTranslation.SeoDescription = request.SeoDescription;
            productTranslation.SeoTitle = request.SeoTitle;
            productTranslation.Description = request.Description;
            productTranslation.Details = request.Details;

            // update ảnh cho sản phẩm
            if (request.ThumbnailImage != null)
            {
                // nhớ _context là đại diện cho database nên có thể where truy vấn như bình thường nhe
                var thumbnailImage = await _context.ProductImages.FirstOrDefaultAsync(x => x.Isdefault == true && x.ProductId == request.Id); // tìm kiếm xem có thằng nào phù hợp không để update thay thế nó
                if (thumbnailImage != null)
                {
                    // nếu khác null ta mới update nó



                    thumbnailImage.FileSize = request.ThumbnailImage.Length;
                    thumbnailImage.ImagePath = await this.SaveFile(request.ThumbnailImage);
                    _context.ProductImages.Update(thumbnailImage);

                }

            }



            return await _context.SaveChangesAsync(); // nó sẽ trả về kiểu int nếu >0 là thành công


        }


        // bắt đầu update Price
        public async Task<bool> UpdatePrice(int ProductId, decimal newPrice)
        {
            var product = await _context.Products.FindAsync(ProductId);
            if (product == null) throw new EShopeException($"Cannot find a Product with id :{ProductId}");
            product.Price = newPrice;
            return await _context.SaveChangesAsync() > 0;// nếu >0 thì nó return true là thành công


        }

        public async Task<bool> UpdateStock(int ProductId, int addedQuantity)
        {
            var product = await _context.Products.FindAsync(ProductId);
            if (product == null) throw new EShopeException($"Cannot find a Product with id :{ProductId}");
            product.Stock += addedQuantity; // số lượng cộng với chất lượng
            return await _context.SaveChangesAsync() > 0;// nếu >0 thì nó return true là thành công
        }




        // hàm để save Image
        private async Task<string> SaveFile(IFormFile file)
        {
            var originalFileName = ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"');
            var fileName = $"{Guid.NewGuid()}{Path.GetExtension(originalFileName)}";
            await _storageService.SaveFileAsync(file.OpenReadStream(), fileName);
            return fileName;

        }



    }
}
