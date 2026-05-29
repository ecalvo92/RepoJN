using JN_WEB.Models;
using Microsoft.AspNetCore.Mvc;

namespace JN_WEB.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        #region Registrar

        [HttpGet]
        public IActionResult Registrar()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Registrar(UsuarioModel model)
        {
            return View();
        }

        #endregion

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
