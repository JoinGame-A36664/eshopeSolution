using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using eShopeSolution.AddminApp.Models;
using eShopSolution.AdminApp.Controllers;
using eShopeSolution.Utilities.Constants;
using Microsoft.AspNetCore.Http;

namespace eShopeSolution.AddminApp.Controllers
{
    public class HomeController : BaseController  // để check luân cái token ,ta check nó trong BaseController đã để [Authorize]
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        [HttpPost]
        public IActionResult Language(NavigationViewModel viewModel)
        {
            HttpContext.Session.SetString(SystemConstants.Appsettings.DefaultLanguageId, viewModel.CurrentLanguageId);
            return RedirectToAction("Index");
        }
    }
}