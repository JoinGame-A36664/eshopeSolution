
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace eShopSolution.ViewModels.Catalog.Products.Manage
{
    public class ProductCreateRequest
    {
        // đây là phần của bảng Product cần tạo
        public decimal Price { set; get; }
        public decimal OriginalPrice { set; get; }
        public int Stock { set; get; }

        // đây là phần cảu ProductTranslation cần tạo 
        public string Name { set; get; }
        public string Description { set; get; }
        public string Details { set; get; }
        public string SeoDescription { set; get; }
        public string SeoTitle { set; get; }

        public string SeoAlias { get; set; }
        public string LanguageId { set; get; }

        // phải install thằng IFormFile nó có chứ năng mã hóa nhị phân để ta sử dụng cho mã hóa nhị phân ảnh
        public IFormFile ThumbnailImage { get; set; }


    }
}
