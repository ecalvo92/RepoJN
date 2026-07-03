using Dapper;
using JN_API.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;

namespace JN_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController(IConfiguration _config) : ControllerBase
    {
        [HttpPut("CambiarContrasennaAPI")]
        public IActionResult CambiarContrasennaAPI(CambiarContrasennaRequestModel model)
        {
            using var context = new SqlConnection(_config["ConnectionStrings:DefaultConnection"]);

            var parameters = new DynamicParameters();
            parameters = new DynamicParameters();
            parameters.Add("@Consecutivo", model.Consecutivo);
            parameters.Add("@Contrasenna", model.Contrasenna);
            parameters.Add("@IndicadorTemp", false);
            var response = context.Execute("spActualizarContrasenna", parameters);

            if (response > 0)
            {
                //3. Enviar un correo electrónico al usuario

                return Ok(response);
            }

            return BadRequest("No se ha actualizado su contraseña");
        }

    }
}
