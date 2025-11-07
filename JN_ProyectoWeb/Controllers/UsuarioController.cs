using JN_ProyectoWeb.Models;
using Microsoft.AspNetCore.Mvc;
using System.Net.Http.Headers;

namespace JN_ProyectoWeb.Controllers
{
    [Seguridad]
    public class UsuarioController : Controller
    {
        private readonly IHttpClientFactory _http;
        private readonly IConfiguration _configuration;
        public UsuarioController(IHttpClientFactory http, IConfiguration configuration)
        {
            _http = http;
            _configuration = configuration;
        }

        #region Perfil

        [HttpGet]
        public IActionResult Perfil()
        {
            using (var context = _http.CreateClient())
            {
                var consecutivo = HttpContext.Session.GetInt32("ConsecutivoUsuario");
                var urlApi = _configuration["Valores:UrlAPI"] + "Usuario/ConsultarUsuario?ConsecutivoUsuario=" + consecutivo;
                context.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", HttpContext.Session.GetString("Token"));
                var respuesta = context.GetAsync(urlApi).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    var datosApi = respuesta.Content.ReadFromJsonAsync<UsuarioModel>().Result;
                    return View(datosApi);
                }

                ViewBag.Mensaje = "No hay información registrada";
                return View(new UsuarioModel());
            }
        }

        [HttpPost]
        public IActionResult Perfil(UsuarioModel usuario)
        {
            ViewBag.Mensaje = "La información no se ha actualizado correctamente";
            usuario.ConsecutivoUsuario = (int)HttpContext.Session.GetInt32("ConsecutivoUsuario")!;

            using (var context = _http.CreateClient())
            {
                var urlApi = _configuration["Valores:UrlAPI"] + "Usuario/ActualizarPerfil";
                context.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", HttpContext.Session.GetString("Token"));
                var respuesta = context.PutAsJsonAsync(urlApi, usuario).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    var datosApi = respuesta.Content.ReadFromJsonAsync<int>().Result;

                    if (datosApi > 0)
                    {
                        ViewBag.Mensaje = "La información se ha actualizado correctamente";
                        HttpContext.Session.SetString("NombreUsuario", usuario.Nombre);
                    }
                }

                return View();
            }
        }

        #endregion

        #region Seguridad

        [HttpGet]
        public IActionResult Seguridad()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Seguridad(UsuarioModel usuario)
        {
            ViewBag.Mensaje = "La información no se ha actualizado correctamente";
            usuario.ConsecutivoUsuario = (int)HttpContext.Session.GetInt32("ConsecutivoUsuario")!;

            using (var context = _http.CreateClient())
            {
                var urlApi = _configuration["Valores:UrlAPI"] + "Usuario/ActualizarSeguridad";
                context.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", HttpContext.Session.GetString("Token"));
                var respuesta = context.PutAsJsonAsync(urlApi, usuario).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    var datosApi = respuesta.Content.ReadFromJsonAsync<int>().Result;

                    if (datosApi > 0)
                        ViewBag.Mensaje = "La información se ha actualizado correctamente";
                }

                return View();
            }
        }

        #endregion

    }
}
