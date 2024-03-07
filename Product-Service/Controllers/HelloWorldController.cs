using Microsoft.AspNetCore.Mvc;

namespace Product_Service.Controllers;

public class HelloWorldController
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return Content("Hello, Denta, wWelcome Back!");
        }
    }
}