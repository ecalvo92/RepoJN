using JN_WEB.Filter;
using Microsoft.AspNetCore.Mvc;

namespace JN_WEB.Controllers
{
    [SesionActivaAttribute]
    public class ContactoController : Controller
    {
        public IActionResult Chat()
        {
            return View();
        }
    }
}
