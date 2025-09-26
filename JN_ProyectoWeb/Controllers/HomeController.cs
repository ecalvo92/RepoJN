using Microsoft.AspNetCore.Mvc;

namespace JN_ProyectoWeb.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Registro()
        {
            return View();
        }

        public IActionResult RecuperarAcceso()
        {
            return View();
        }

        public IActionResult Principal()
        {
            return View();
        }
    }
}
