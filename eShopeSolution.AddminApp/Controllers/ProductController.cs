using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using eShopeSolution.AddminApp.Services;
using eShopeSolution.Utilities.Constants;
using eShopSolution.ViewModels.Catalog.Products;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

namespace eShopeSolution.AddminApp.Controllers
{
    public class ProductController : Controller
    {
        // tiếm tục tiêm Di
        private readonly IProductApiClient _productApiClient;

        private readonly IConfiguration _configuration;

        public ProductController(IProductApiClient productApiClient,
            IConfiguration configuration)
        {
            _configuration = configuration;
            _productApiClient = productApiClient;
        }

        public async Task<IActionResult> Index(string keyword, int pageIndex = 1, int pageSize = 10)
        {
            var languageId = HttpContext.Session.GetString(SystemConstants.Appsettings.DefaultLanguageId);

            var request = new GetManageProductPagingRequest()
            {
                KeyWord = keyword,
                PageIndex = pageIndex,
                PageSize = pageSize,
                LanguageId = languageId,
            };
            var data = await _productApiClient.GetProductPagings(request);
            ViewBag.Keyword = keyword;
            if (TempData["result"] != null)
            {
                ViewBag.SuccessMsg = TempData["result"];
            }
            return View(data.ResultObj);
        }

        [HttpGet]  // lấy lên cho người dùng xem
        public IActionResult Create()
        {
            // add view với View Name :Create , Template : Create , Modelss class : ProductCereateRequest và layout chung

            // bấm tạo mới phát chạy phương thức này trả về một form để thực hiện create
            return View();
        }

        [HttpPost] // người dùng đưa giữ liệu suống
        [Consumes("multipart/form-data")]  // phải có nó nó mới nhận được  cái data file từ FromFrom tương ứng với thằng backEnd
        public async Task<IActionResult> Create([FromForm] ProductCreateRequest request)
        {
            // dữ liệu đi từ view vào đây rooid vào CreateProduct
            if (!ModelState.IsValid)
                return View();
            var result = await _productApiClient.CreateProduct(request);  // cái này trả ra true false sang mà xem
            if (result)
            {
                TempData["result"] = "Thêm mới sản phẩm thành công";
                return RedirectToAction("Index");
            }

            ModelState.AddModelError("", "Thêm sản phẩm thất bại");
            return View(request);
        }

        [HttpGet]
        public async Task<IActionResult> Edit(int productId, string languageId)
        {
            //lấy sản phẩm ra để cho người dùng xem

            var result = await _productApiClient.GetById(productId, languageId);

            if (result != null)
            {
                var ProductRequest = new ProductUpdateRequest()
                {
                    Name = result.Name,
                    Description = result.Description,
                    Details = result.Details,
                    SeoAlias = result.SeoAlias,
                    SeoDescription = result.SeoDescription,
                    SeoTitle = result.SeoTitle,
                    Id = productId,
                    LanguageId = languageId,
                };

                return View(ProductRequest);
            }
            return RedirectToAction("Error", "Home");
        }

        [HttpPost]
        [Consumes("multipart/form-data")]
        public async Task<IActionResult> Edit([FromForm] ProductUpdateRequest request)
        {
            if (!ModelState.IsValid)
                return View();

            var result = await _productApiClient.UpdateProduct(request);
            if (result > 0)
            {
                // khi thành công ta có thể tạo một TempData  đây là đầu đi và sẽ có đầu nhận dữ liệu này nhe bên View Của nó
                TempData["result"] = "Sửa Thành Công"; //có key là result
                return RedirectToAction("Index");
            }

            return View(request);
        }
    }
}