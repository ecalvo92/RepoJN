using JN_ProyectoWeb.Models;
using Microsoft.AspNetCore.Mvc;

namespace JN_ProyectoWeb.Controllers
{
    [Seguridad]
    public class UsuarioController : Controller
    {
        [HttpGet]
        public IActionResult Perfil()
        {
            return View();
        }
    }
}
