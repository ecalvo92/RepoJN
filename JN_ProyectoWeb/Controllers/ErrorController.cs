using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Mvc;

namespace JN_ProyectoWeb.Controllers
{
    public class ErrorController : Controller
    {
        public IActionResult MostrarError()
        {
            var exception = HttpContext.Features.Get<IExceptionHandlerFeature>();
            return View();
        }
    }
}
