using JN_ProyectoWeb.Models;
using Microsoft.AspNetCore.Mvc;
using System.Net.Http.Headers;
using static System.Net.WebRequestMethods;

namespace JN_ProyectoWeb.Controllers
{
    [Seguridad]
    public class AdminController : Controller
    {
        private readonly IHttpClientFactory _http;
        private readonly IConfiguration _configuration;
        public AdminController(IHttpClientFactory http, IConfiguration configuration)
        {
            _http = http;
            _configuration = configuration;
        }

        public IActionResult Principal()
        {
            if (HttpContext.Session.GetInt32("ConsecutivoPerfil") != 1)
            {
                return RedirectToAction("Principal", "Home");
            }

            ConsultarCantidadProductos();
            ConsultarCantidadCalificaciones();
            ConsultarMejores();
            ConsultarPeores();

            return View();
        }

        private void ConsultarCantidadProductos()
        {
            using (var context = _http.CreateClient())
            {
                var urlApi = _configuration["Valores:UrlAPI"] + "Admin/CantidadProductos";
                context.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", HttpContext.Session.GetString("Token"));
                var respuesta = context.GetAsync(urlApi).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    var datosApi = respuesta.Content.ReadFromJsonAsync<int>().Result;
                    ViewBag.CantidadProductos = datosApi;
                    return;
                }

                ViewBag.CantidadProductos = 0;
            }
        }

        private void ConsultarCantidadCalificaciones()
        {
            using (var context = _http.CreateClient())
            {
                var urlApi = _configuration["Valores:UrlAPI"] + "Admin/CantidadResennas";
                context.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", HttpContext.Session.GetString("Token"));
                var respuesta = context.GetAsync(urlApi).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    var datosApi = respuesta.Content.ReadFromJsonAsync<int>().Result;
                    ViewBag.CantidadResennas = datosApi;
                    return;
                }

                ViewBag.CantidadResennas = 0;
            }
        }

        private void ConsultarMejores()
        {
            using (var context = _http.CreateClient())
            {
                var urlApi = _configuration["Valores:UrlAPI"] + "Admin/Mejores";
                context.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", HttpContext.Session.GetString("Token"));
                var respuesta = context.GetAsync(urlApi).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    var datosApi = respuesta.Content.ReadFromJsonAsync<List<AdminModel>>().Result;
                    ViewBag.Mejores = datosApi;
                    return;
                }

                ViewBag.Mejores = new List<AdminModel>();
            }
        }

        private void ConsultarPeores()
        {
            using (var context = _http.CreateClient())
            {
                var urlApi = _configuration["Valores:UrlAPI"] + "Admin/Peores";
                context.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", HttpContext.Session.GetString("Token"));
                var respuesta = context.GetAsync(urlApi).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    var datosApi = respuesta.Content.ReadFromJsonAsync<List<AdminModel>>().Result;
                    ViewBag.Peores = datosApi;
                    return;
                }

                ViewBag.Peores = new List<AdminModel>();
            }
        }

    }
}
