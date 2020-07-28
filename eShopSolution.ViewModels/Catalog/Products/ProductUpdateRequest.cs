using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace eShopSolution.ViewModels.Catalog.Products
{
    public class ProductUpdateRequest
    {
        public int Id { set; get; }

        public string Name { set; get; }
        public string Description { set; get; }
        public string Details { set; get; }
        public string SeoDescription { set; get; }
        public string SeoTitle { set; get; }

        public string SeoAlias { get; set; }
        public string LanguageId { set; get; } // chỉ để query chứ ko update thằng này

        // phải install thằng IFormFile nó có chứ năng mã hóa nhị phân để ta sử dụng cho mã hóa nhị phân ảnh
        public IFormFile ThumbnailImage { get; set; }

    }
}
