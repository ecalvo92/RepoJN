using JN_ProyectoAPI.Models;
using Microsoft.AspNetCore.Mvc;

namespace JN_ProyectoAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HomeController : ControllerBase
    {

        [HttpPost]
        [Route("IniciarSesion")]
        public IActionResult IniciarSesion(UsuarioModel usuario)
        {
            return Ok("HOLA");
        }

    }
}
