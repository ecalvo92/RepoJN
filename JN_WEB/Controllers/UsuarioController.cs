using JN_WEB.Models;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using static System.Net.WebRequestMethods;

namespace JN_WEB.Controllers
{
    public class UsuarioController(
        IHttpClientFactory _http,
        IConfiguration _config) : Controller
    {

        #region Cambiar Contraseña y Perfil

        [HttpGet]
        public IActionResult Configuracion()
        {
            var consecutivo = HttpContext.Session.GetInt32("Consecutivo")!.Value;

            using var client = _http.CreateClient();
            var url = _config["Valores:UrlApi"] + "Usuario/ConsultarUsuarioAPI?consecutivo=" + consecutivo;
            var response = client.GetAsync(url).Result;

            if (response.StatusCode == HttpStatusCode.OK || response.StatusCode == HttpStatusCode.NotFound)
            {
                var datos = response.Content.ReadFromJsonAsync<UsuarioModel>().Result;

                return View("Configuracion", datos);
            }

            throw new Exception("Error al cambiar la contraseña");
        }

        [HttpPost]
        public IActionResult CambiarContrasenna(UsuarioModel model) 
        {
            model.Consecutivo = HttpContext.Session.GetInt32("Consecutivo")!.Value;

            using var client = _http.CreateClient();
            var url = _config["Valores:UrlApi"] + "Usuario/CambiarContrasennaAPI";
            var response = client.PutAsJsonAsync(url, model).Result;

            if (response.StatusCode == HttpStatusCode.OK)
            {
                return RedirectToAction("Salir", "Home");
            }
            else if (response.StatusCode == HttpStatusCode.BadRequest)
            {
                ViewBag.MensajeSeguridad = response.Content.ReadAsStringAsync().Result;
                return View("Configuracion", model);
            }

            throw new Exception("Error al cambiar la contraseña");
        }

        [HttpPost]
        public IActionResult CambiarPerfil(UsuarioModel model)
        {
            model.Consecutivo = HttpContext.Session.GetInt32("Consecutivo")!.Value;

            using var client = _http.CreateClient();
            var url = _config["Valores:UrlApi"] + "Usuario/CambiarPerfilAPI";
            var response = client.PutAsJsonAsync(url, model).Result;

            if (response.StatusCode == HttpStatusCode.OK || response.StatusCode == HttpStatusCode.BadRequest)
            {
                HttpContext.Session.SetString("Nombre", model!.Nombre);

                ViewBag.MensajePerfil = response.Content.ReadAsStringAsync().Result;
                return View("Configuracion", model);
            }

            throw new Exception("Error al cambiar la contraseña");
        }

        #endregion
    }
}
