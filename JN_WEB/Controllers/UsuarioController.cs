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
        public IActionResult Perfil()
        {
            return View();
        }

        #region Cambiar Contraseña

        [HttpGet]
        public IActionResult Configuracion()
        {
            return View();
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
                ViewBag.Mensaje = response.Content.ReadAsStringAsync().Result;
                return View();
            }

            throw new Exception("Error al cambiar la contraseña");
        }

        #endregion
    }
}
