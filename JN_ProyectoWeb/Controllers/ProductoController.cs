using JN_ProyectoWeb.Models;
using Microsoft.AspNetCore.Mvc;

namespace JN_ProyectoWeb.Controllers
{
    public class ProductoController : Controller
    {
        private readonly IHttpClientFactory _http;
        private readonly IConfiguration _configuration;
        public ProductoController(IHttpClientFactory http, IConfiguration configuration)
        {
            _http = http;
            _configuration = configuration;
        }

        [HttpGet]
        public IActionResult ConsultarProductos()
        {
            using (var context = _http.CreateClient())
            {
                var urlApi = _configuration["Valores:UrlAPI"] + "Producto/ConsultarProductos";
                var respuesta = context.GetAsync(urlApi).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    var datosApi = respuesta.Content.ReadFromJsonAsync<List<ProductoModel>>().Result;
                    return View(datosApi);
                }

                ViewBag.Mensaje = "No hay productos registrados";
                return View(new List<ProductoModel>());
            }
        }
    }
}
