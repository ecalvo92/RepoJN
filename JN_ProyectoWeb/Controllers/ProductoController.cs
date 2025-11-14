using JN_ProyectoWeb.Models;
using Microsoft.AspNetCore.Mvc;
using System.Net.Http.Headers;

namespace JN_ProyectoWeb.Controllers
{
    [Seguridad]
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
            var respuesta = ConsultarDatosProductos(0);
            return View(respuesta);
        }


        [HttpGet]
        public IActionResult AgregarProductos()
        {
            return View();
        }

        [HttpPost]
        public IActionResult AgregarProductos(ProductoModel producto, IFormFile Imagen)
        {
            using (var context = _http.CreateClient())
            {
                producto.Imagen = "/imagenes/";
                var urlApi = _configuration["Valores:UrlAPI"] + "Producto/AgregarProductos";
                context.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", HttpContext.Session.GetString("Token"));
                var respuesta = context.PostAsJsonAsync(urlApi, producto).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    var datosApi = respuesta.Content.ReadFromJsonAsync<int>().Result;

                    if (datosApi > 0)
                    {
                        //save de la imagen
                        string carpetaDestino = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "imagenes");

                        if (!Directory.Exists(carpetaDestino))
                            Directory.CreateDirectory(carpetaDestino);

                        string nombreArchivo = datosApi + ".png";
                        string rutaCompleta = Path.Combine(carpetaDestino, nombreArchivo);

                        using (var stream = new FileStream(rutaCompleta, FileMode.Create))
                        {
                            Imagen.CopyTo(stream);
                        }

                        return RedirectToAction("ConsultarProductos", "Producto");
                    }
                }

                ViewBag.Mensaje = "No se ha registrado la información";
                return View();
            }
        }


        [HttpGet]
        public IActionResult ActualizarProductos(int id)
        {
            var respuesta = ConsultarDatosProductos(id);
            return View(respuesta?.FirstOrDefault());
        }

        [HttpPost]
        public IActionResult ActualizarProductos(ProductoModel producto, IFormFile Imagen)
        {
            using (var context = _http.CreateClient())
            {
                producto.Imagen = "/imagenes/";
                var urlApi = _configuration["Valores:UrlAPI"] + "Producto/ActualizarProductos";
                context.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", HttpContext.Session.GetString("Token"));
                var respuesta = context.PutAsJsonAsync(urlApi, producto).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    var datosApi = respuesta.Content.ReadFromJsonAsync<int>().Result;

                    if (datosApi > 0)
                    {
                        if (Imagen != null)
                        {
                            //save de la imagen
                            string carpetaDestino = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "imagenes");

                            if (!Directory.Exists(carpetaDestino))
                                Directory.CreateDirectory(carpetaDestino);

                            string nombreArchivo = producto.ConsecutivoProducto + ".png";
                            string rutaCompleta = Path.Combine(carpetaDestino, nombreArchivo);

                            using (var stream = new FileStream(rutaCompleta, FileMode.Create))
                            {
                                Imagen.CopyTo(stream);
                            }
                        }

                        return RedirectToAction("ConsultarProductos", "Producto");
                    }
                }

                ViewBag.Mensaje = "No se ha registrado la información";
                return View();
            }
        }

        private List<ProductoModel>? ConsultarDatosProductos(int id)
        {
            using (var context = _http.CreateClient())
            {
                var urlApi = _configuration["Valores:UrlAPI"] + "Producto/ConsultarProductos?ConsecutivoProducto=" + id;

                context.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", HttpContext.Session.GetString("Token"));
                var respuesta = context.GetAsync(urlApi).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    var datosApi = respuesta.Content.ReadFromJsonAsync<List<ProductoModel>>().Result;
                    return datosApi;
                }

                ViewBag.Mensaje = "No hay productos registrados";
                return new List<ProductoModel>();
            }
        }

    }
}
