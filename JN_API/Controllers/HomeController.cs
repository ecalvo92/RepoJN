using JN_API.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace JN_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HomeController : ControllerBase
    {

        [HttpPost("RegistrarAPI")]
        public IActionResult RegistrarAPI(UsuarioModel model)
        {
            return Ok();
        }

    }
}
