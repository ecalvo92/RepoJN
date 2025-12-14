using Dapper;
using JN_ProyectoAPI.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;

namespace JN_ProyectoAPI.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class AdminController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        public AdminController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [HttpGet]
        [Route("CantidadProductos")]
        public IActionResult CantidadProductos()
        {
            using (var context = new SqlConnection(_configuration["ConnectionStrings:BDConnection"]))
            {
                var parametros = new DynamicParameters();
                parametros.Add("@ConsecutivoUsuario", HttpContext.User.FindFirst("id")?.Value);

                var resultado = context.QueryFirstOrDefault<int>("CantidadProductos", parametros);
                return Ok(resultado);
            }
        }

        [HttpGet]
        [Route("CantidadResennas")]
        public IActionResult CantidadResennas()
        {
            using (var context = new SqlConnection(_configuration["ConnectionStrings:BDConnection"]))
            {
                var parametros = new DynamicParameters();
                parametros.Add("@ConsecutivoUsuario", HttpContext.User.FindFirst("id")?.Value);

                var resultado = context.QueryFirstOrDefault<int>("CantidadResennas", parametros);
                return Ok(resultado);
            }
        }

        [HttpGet]
        [Route("Mejores")]
        public IActionResult Mejores()
        {
            using (var context = new SqlConnection(_configuration["ConnectionStrings:BDConnection"]))
            {
                var parametros = new DynamicParameters();
                parametros.Add("@ConsecutivoUsuario", HttpContext.User.FindFirst("id")?.Value);

                var resultado = context.Query<AdminResponse>("Mejores", parametros);
                return Ok(resultado);
            }
        }

        [HttpGet]
        [Route("Peores")]
        public IActionResult Peores()
        {
            using (var context = new SqlConnection(_configuration["ConnectionStrings:BDConnection"]))
            {
                var parametros = new DynamicParameters();
                parametros.Add("@ConsecutivoUsuario", HttpContext.User.FindFirst("id")?.Value);

                var resultado = context.Query<AdminResponse>("Peores", parametros);
                return Ok(resultado);
            }
        }

    }
}
