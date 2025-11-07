using Dapper;
using JN_ProyectoAPI.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;

namespace JN_ProyectoAPI.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        public UsuarioController(IConfiguration configuration)
        {
            _configuration = configuration;
        }


        [HttpGet]
        [Route("ConsultarUsuario")]
        public IActionResult ConsultarUsuario(int ConsecutivoUsuario)
        {
            using (var context = new SqlConnection(_configuration["ConnectionStrings:BDConnection"]))
            {
                var parametros = new DynamicParameters();
                parametros.Add("ConsecutivoUsuario", ConsecutivoUsuario);

                var resultado = context.QueryFirstOrDefault<DatosUsuarioResponseModel>("ConsultarUsuario", parametros);
                return Ok(resultado);
            }
        }


        [HttpPut]
        [Route("ActualizarPerfil")]
        public IActionResult ActualizarPerfil(PerfilRequestModel usuario)
        {
            using (var context = new SqlConnection(_configuration["ConnectionStrings:BDConnection"]))
            {
                var parametros = new DynamicParameters();
                parametros.Add("ConsecutivoUsuario", usuario.ConsecutivoUsuario);
                parametros.Add("Identificacion", usuario.Identificacion);
                parametros.Add("Nombre", usuario.Nombre);
                parametros.Add("CorreoElectronico", usuario.CorreoElectronico);

                var resultado = context.Execute("ActualizarPerfil", parametros);
                return Ok(resultado);
            }
        }


        [HttpPut]
        [Route("ActualizarSeguridad")]
        public IActionResult ActualizarSeguridad(SeguridadRequestModel usuario)
        {
            using (var context = new SqlConnection(_configuration["ConnectionStrings:BDConnection"]))
            {
                var parametros = new DynamicParameters();
                parametros.Add("ConsecutivoUsuario", usuario.ConsecutivoUsuario);
                parametros.Add("Contrasenna", usuario.Contrasenna);

                var resultado = context.Execute("ActualizarContrasenna", parametros);
                return Ok(resultado);
            }
        }

    }
}
