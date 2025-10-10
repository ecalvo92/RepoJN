using Dapper;
using JN_ProyectoAPI.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.ComponentModel.DataAnnotations;

namespace JN_ProyectoAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HomeController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        public HomeController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [HttpPost]
        [Route("Registro")]
        public IActionResult Registro(RegistroUsuarioRequestModel usuario)
        {
            using (var context = new SqlConnection(_configuration["ConnectionStrings:BDConnection"]))
            {
                var parametros = new DynamicParameters();
                parametros.Add("@Identificacion", usuario.Identificacion);
                parametros.Add("@Nombre", usuario.Nombre);
                parametros.Add("@CorreoElectronico", usuario.CorreoElectronico);
                parametros.Add("@Contrasenna", usuario.Contrasenna);

                var resultado = context.Execute("Registro", parametros);
                return Ok(resultado);
            }
        }


        [HttpPost]
        [Route("ValidarSesion")]
        public IActionResult ValidarSesion(ValidarSesionRequestModel usuario)
        {
            using (var context = new SqlConnection(_configuration["ConnectionStrings:BDConnection"]))
            {
                var parametros = new DynamicParameters();
                parametros.Add("@CorreoElectronico", usuario.CorreoElectronico);
                parametros.Add("@Contrasenna", usuario.Contrasenna);

                var resultado = context.QueryFirstOrDefault<DatosUsuarioResponseModel>("ValidarSesion", parametros);

                if (resultado != null)
                    return Ok(resultado);

                return NotFound();
            }
        }


        [HttpGet]
        [Route("ValidarUsuario")]
        public IActionResult ValidarUsuario([Required]string CorreoElectronico)
        {
            using (var context = new SqlConnection(_configuration["ConnectionStrings:BDConnection"]))
            {
                var parametros = new DynamicParameters();
                parametros.Add("@CorreoElectronico", CorreoElectronico);

                var resultado = context.QueryFirstOrDefault<DatosUsuarioResponseModel>("ValidarUsuario", parametros);

                if (resultado != null)
                { 
                    //Enviarle un correo al usuario con una contraseña temporal   
                    return Ok(resultado);
                }

                return NotFound();
            }
        }
    }
}
