using Dapper;
using JN_ProyectoAPI.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;

namespace JN_ProyectoAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductoController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        public ProductoController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [HttpGet]
        [Route("ConsultarProductos")]
        public IActionResult ConsultarProductos()
        {
            using (var context = new SqlConnection(_configuration["ConnectionStrings:BDConnection"]))
            {
                var parametros = new DynamicParameters();

                var resultado = context.Query<DatosProductoResponseModel>("ConsultarProductos", parametros);
                return Ok(resultado);
            }
        }
        
    }
}
