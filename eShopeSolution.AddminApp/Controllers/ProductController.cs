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

        [HttpGet]
        public async Task<IActionResult> Details(int Id, string LanguageId) // lấy ra Id nhớ Index cũng phải có Id nhe
        {
            // add View với View Name= Details , Template=Details , Model class=UserVm , và layout dùng chung

            var result = await _productApiClient.GetById(Id, LanguageId); // trả về một ProductVm
            return View(result); // nên ta sẽ trả luân về ProductVm
        }

        [HttpGet]  // lấy lên cho người dùng xem
        public IActionResult Create()
        {
            // add view với View Name :Create , Template : Create , Modelss class : ProductCereateRequest và layout chung

            // bấm tạo mới phát chạy phương thức này trả về một form để thực hiện create
            return View();
        }

        [HttpPost] // người dùng đưa giữ liệu suống
        /*[Consumes("multipart/form-data")]*/  // phải có nó nó mới nhận được  cái data file từ FromFrom tương ứng với thằng backEnd
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
        public async Task<IActionResult> Edit(int id, string LanguageId)
        {
            //lấy sản phẩm ra để cho người dùng xem

            var result = await _productApiClient.GetById(id, LanguageId);

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
                    Id = id,
                    LanguageId = LanguageId,
                };

                return View(ProductRequest);
            }
            return RedirectToAction("Error", "Home");
        }

        [HttpPost]
        public async Task<IActionResult> Edit(ProductUpdateRequest request)
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

        [HttpGet]
        public IActionResult Delete(int id)  // lấy id của đối tựng cần xóa về
        {
            return View(new ProductDeleteRequest()
            {
                Id = id,
            });
        }

        [HttpPost]
        public async Task<IActionResult> Delete(ProductDeleteRequest request)  // lấy request từ thằng backeEnd thông qua thằng UserApiClient
        {
            if (!ModelState.IsValid)
                return View();
            var result = await _productApiClient.Delete(request.Id);// với id lấy về trên kia trong request và thực hiện xóa
            if (result)
            {
                // khi thành công ta có thể tạo một TempData  đây là đầu đi và sẽ có đầu nhận dữ liệu này nhe bên View Của nó
                TempData["result"] = "Xóa Thành Công"; //có key là result
                return RedirectToAction("Index");  // nếu thành công thì chuyển tới phân trang là Index
            }

            return View(request);//nếu ko thành công ta chả về request để xem request
        }
    }
}