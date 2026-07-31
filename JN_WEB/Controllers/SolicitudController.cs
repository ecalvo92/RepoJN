using JN_WEB.Filter;
using JN_WEB.Models;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using System.Net.Http.Headers;

namespace JN_WEB.Controllers
{
    [SesionActivaAttribute]
    public class SolicitudController(
        IHttpClientFactory _http,
        IConfiguration _config) : Controller
    {

        [HttpGet]
        public IActionResult Bandeja()
        {
            using var client = _http.CreateClient();

            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", HttpContext.Session.GetString("Token"));
            var url = _config["Valores:UrlApi"] + "Solicitud/ConsultarSolicitudesUsuarioAPI";
            var response = client.GetAsync(url).Result;

            if (response.StatusCode == HttpStatusCode.OK)
            {
                var datos = response.Content.ReadFromJsonAsync<List<SolicitudModel>>().Result;
                return View(datos);
            }
            else if (response.StatusCode == HttpStatusCode.NotFound)
            {
                ViewBag.MensajeSeguridad = response.Content.ReadAsStringAsync().Result;
                return View(new List<SolicitudModel>());
            }
            else if (response.StatusCode == HttpStatusCode.Unauthorized)
            {
                return RedirectToAction("Salir", "Home");
            }

            throw new Exception("Error al consultar las solicitudes");
        }

        #region Registrar Solicitud

        [HttpGet]
        public IActionResult AgregarSolicitud()
        {
            return View();
        }

        [HttpPost]
        public IActionResult AgregarSolicitud(SolicitudModel model, IFormFile Imagen)
        {
            using var client = _http.CreateClient();

            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", HttpContext.Session.GetString("Token"));
            var url = _config["Valores:UrlApi"] + "Solicitud/RegistrarSolicitudAPI";
            var response = client.PostAsJsonAsync(url, model).Result;

            if (response.StatusCode == HttpStatusCode.OK)
            {
                return RedirectToAction("Bandeja", "Solicitud");
            }
            else if (response.StatusCode == HttpStatusCode.BadRequest)
            {
                ViewBag.Mensaje = response.Content.ReadAsStringAsync().Result;
                return View();
            }

            throw new Exception("Error al registrar la solicitud");
        }

        #endregion

        [HttpPost]
        public IActionResult CancelarSolicitud(int consecutivo)
        {
            using var client = _http.CreateClient();

            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", HttpContext.Session.GetString("Token"));
            var url = _config["Valores:UrlApi"] + "Solicitud/CancelarSolicitudUsuarioAPI?consecutivoSolicitud=" + consecutivo;
            var response = client.DeleteAsync(url).Result;

            return Json(response.Content.ReadAsStringAsync().Result);
        }

    }
}
