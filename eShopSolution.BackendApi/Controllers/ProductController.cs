using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using eShopSolution.Application.Catalog.Products;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

// tải nuget :Swashbuckle.AspNetCore

namespace eShopSolution.BackendApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        // bắt đầu Di
        private readonly IPublicProductService _publicProductService;
        public ProductController(IPublicProductService publicProductService)  // bắt đầu dử dụng cá phương thức mà ta định nghĩa cho sản phẩm
        {
            _publicProductService = publicProductService;  // muốn tiêm vào nhó khai báo DI bên service nhe
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var Products = await _publicProductService.GetAll();
            return Ok(Products); 
        }
    }
}
