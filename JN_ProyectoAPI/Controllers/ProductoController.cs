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
    public class ProductoController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        public ProductoController(IConfiguration configuration)
        {
            _configuration = configuration;
        }


        [HttpGet]
        [Route("ConsultarProductos")]
        public IActionResult ConsultarProductos(int ConsecutivoProducto)
        {
            using (var context = new SqlConnection(_configuration["ConnectionStrings:BDConnection"]))
            {
                var parametros = new DynamicParameters();
                parametros.Add("@ConsecutivoProducto", ConsecutivoProducto);

                var resultado = context.Query<DatosProductoResponseModel>("ConsultarProductos", parametros);
                return Ok(resultado);
            }
        }


        [HttpPost]
        [Route("AgregarProductos")]
        public IActionResult AgregarProductos(RegistroProductoRequestModel producto)
        {
            using (var context = new SqlConnection(_configuration["ConnectionStrings:BDConnection"]))
            {
                var parametros = new DynamicParameters();
                parametros.Add("@Nombre", producto.Nombre);
                parametros.Add("@Descripcion", producto.Descripcion);
                parametros.Add("@Precio", producto.Precio);
                parametros.Add("@Imagen", producto.Imagen);

                var resultado = context.QueryFirstOrDefault<DatosProductoResponseModel>("RegistroProducto", parametros);
                return Ok(resultado!.ConsecutivoProducto);
            }
        }


        [HttpPut]
        [Route("ActualizarProductos")]
        public IActionResult ActualizarProductos(ActualizarProductoRequestModel producto)
        {
            using (var context = new SqlConnection(_configuration["ConnectionStrings:BDConnection"]))
            {
                var parametros = new DynamicParameters();
                parametros.Add("@ConsecutivoProducto", producto.ConsecutivoProducto);
                parametros.Add("@Nombre", producto.Nombre);
                parametros.Add("@Descripcion", producto.Descripcion);
                parametros.Add("@Precio", producto.Precio);
                parametros.Add("@Imagen", producto.Imagen);

                var resultado = context.Execute("ActualizarProducto", parametros);
                return Ok(resultado);
            }
        }
        

    }
}
