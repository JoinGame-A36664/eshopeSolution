using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using eShopSolution.Application.Catalog.Products;
using eShopSolution.ViewModels.Catalog.ProductImages;
using eShopSolution.ViewModels.Catalog.Products;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

// tải nuget :Swashbuckle.AspNetCore

namespace eShopSolution.BackendApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        // bắt đầu Di
        private readonly IPublicProductService _publicProductService;
        private readonly IMangeProductService _mangeProductService;
        public ProductsController(IPublicProductService publicProductService, IMangeProductService mangeProductService)  // bắt đầu dử dụng cá phương thức mà ta định nghĩa cho sản phẩm
        {
            _publicProductService = publicProductService;  // muốn tiêm vào nhó khai báo DI bên service nhe
            _mangeProductService = mangeProductService;
        }

        // CÁC PHƯƠNG THỨC CẢU PUBLIC

        // http://localhost:port/product
        //[HttpGet("{languageId}")]
        //public async Task<IActionResult> GetAll(string languageId)
        //{
        //    var Products = await _publicProductService.GetAll(languageId);
        //    return Ok(Products);
        //}

        // http://localhost:port/products?pageIndex=1 &&pageSize=10&&CategoryId=
        [HttpGet("{languageId}")] // đặt alias(bí danh) cho nó để không trùng với thằng ở trên chỉ dành cho HttpGet
        public async Task<IActionResult> GetAllPaging(string languageId, [FromQuery] GetPublicProductPagingRequest request) // tất cả tham số đều lấy từ query ra khi ta để FromQuery
        {
            var Products = await _publicProductService.GetAllByCategoryId(languageId, request); // thằng request này có languageId rồi nhe
            return Ok(Products);
        }


        // CÁC PHƯƠNG THỨC CỦA MANAGE



        // SỬ DỤNG CÁC PHƯƠNG THỨC CẢU PRODUCT

        // http://localhost:port/product/1
        [HttpGet("{productId}/{languageId}")] // thằng này sẽ chuyền vào id cảu sản phẩm  trên ta lấy vd productId=1
        public async Task<IActionResult> GetById(int productId, string languageId)
        {
            var Product = await _mangeProductService.GetById(productId, languageId);
            if (Product == null)
                return BadRequest("Cannot dìn Product");
            return Ok(Product);
        }




        [HttpPost]
        public async Task<IActionResult> Create([FromForm] ProductCreateRequest request) // tất cả các thuộc tính phải using form data
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var productId = await _mangeProductService.Create(request); // thằng này chả về id nhe
            if (productId == 0)
                return BadRequest();// đây là nỗi 400

            // để có product chuyền về thì ta phải
            var product = await _mangeProductService.GetById(productId, request.LanguageId);
            // cách 1:
            //return Created(nameof(GetById), product);
            // cách 2:
            return CreatedAtAction(nameof(GetById), new { id = productId }, product); // Ok trả ra 200 còn created là 201  khi học jquery đã được học cái này

        }

        [HttpPut] // update tất cả phần
        public async Task<IActionResult> Update([FromForm] ProductUpdateRequest request) // tất cả các thuộc tính phải using form data
        {
            var affectedResult = await _mangeProductService.Update(request); // thằng này chả về id nhe
            if (affectedResult == 0)
                return BadRequest("Cannot find Id");// đây là nỗi 400



            return Ok();

        }


        [HttpDelete("{productId}")]
        public async Task<IActionResult> Delete(int productId) // 
        {
            var affectedResult = await _mangeProductService.Delete(productId); // thằng này chả về id nhe
            if (affectedResult == 0)
                return BadRequest();// đây là nỗi 400



            return Ok();

        }

        //  [HttpPut("price/{id}/{newPrice}")] //đây là update cả phần
        [HttpPatch("{productId}/{newPrice}")] // đây là update 1 phần
        public async Task<IActionResult> UpdatePrice(int productId, decimal newPrice) // không cần fromquery nữa nếu để như thế này là bắt buộc
        {
            var isSuccessful = await _mangeProductService.UpdatePrice(productId, newPrice); // thằng này chả về id nhe
            if (isSuccessful == false)
                return BadRequest();// đây là nỗi 400
            return Ok();
        }

        // SỬ DỤNG CÁC PHƯƠNG THỨC CỦA IMAGE

        [HttpPost("{productId}/images")]
        public async Task<IActionResult> CreateImage(int productId,[FromForm] ProductImageCreateRequest request) // tất cả các thuộc tính phải using form data
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var imageId = await _mangeProductService.AddImage(productId,request); // thằng này chả về id nhe
            if (imageId == 0)
                return BadRequest();// đây là nỗi 400

            // để có product chuyền về thì ta phải
            var image = await _mangeProductService.GetImageById(imageId);
        
            return CreatedAtAction(nameof(GetImageById), new { id = imageId }, image); // Ok trả ra 200 còn created là 201  khi học jquery đã được học cái này

        }


        [HttpPut("{productId}/images/{imageId}")]
        public async Task<IActionResult> UpdateImage( int imageId, [FromForm] ProductImageUpdateRequest request) // tất cả các thuộc tính phải using form data
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var result = await _mangeProductService.UpDateImage(imageId, request); // thằng này chả về id nhe
            if (result == 0)
                return BadRequest();// đây là nỗi 400

            return Ok(); // Ok trả ra 200 còn created là 201  khi học jquery đã được học cái này

        }

        [HttpDelete("{productId}/images/{imageId}")]
        public async Task<IActionResult> RemoveImage(int imageId) // tất cả các thuộc tính phải using form data
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var result = await _mangeProductService.RemoveImage(imageId); // thằng này chả về id nhe
            if (result == 0)
                return BadRequest();// đây là nỗi 400

            return Ok(); // Ok trả ra 200 còn created là 201  khi học jquery đã được học cái này

        }

        [HttpGet("{productId}/images/{imageId}")] // nhớ phải đi qua images rồi mới đến imageId (có nghĩa là image của sản phẩm nay)
        public async Task<IActionResult> GetImageById(int productId, int imageId)
        {
            var image = await _mangeProductService.GetImageById(imageId);
            if (image == null)
                return BadRequest("Cannot dìn Product");
            return Ok(image);
        }


    }
}
