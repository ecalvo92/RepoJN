using JN_WEB.Filter;
using JN_WEB.Models;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using System.Net.Http.Headers;

namespace JN_WEB.Controllers
{
    [SesionActivaAttribute]
    public class ContactoController(IHttpClientFactory _http, IConfiguration _config) : Controller
    {
        public IActionResult Chat()
        {
            using var client = _http.CreateClient();

            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", HttpContext.Session.GetString("Token"));
            var url = _config["Valores:UrlApi"] + "Contacto/ConsultarSolicitudesChatAPI";
            var response = client.GetAsync(url).Result;

            List<SolicitudChatModel> solicitudes = [];

            if (response.StatusCode == HttpStatusCode.OK)
                solicitudes = response.Content.ReadFromJsonAsync<List<SolicitudChatModel>>().Result ?? [];
            else if (response.StatusCode == HttpStatusCode.Unauthorized)
                return RedirectToAction("Salir", "Home");

            ViewBag.Token = HttpContext.Session.GetString("Token");
            ViewBag.UrlHub = _config["Valores:UrlHub"];
            ViewBag.ConsecutivoUsuario = HttpContext.Session.GetInt32("Consecutivo");
            return View(solicitudes);
        }

        [HttpGet]
        public IActionResult ConsultarMensajes(int consecutivoSolicitud)
        {
            using var client = _http.CreateClient();

            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", HttpContext.Session.GetString("Token"));
            var url = _config["Valores:UrlApi"] + $"Contacto/ConsultarMensajesAPI?consecutivoSolicitud={consecutivoSolicitud}";
            var response = client.GetAsync(url).Result;

            if (response.StatusCode == HttpStatusCode.Unauthorized)
                return Unauthorized();

            if (response.StatusCode == HttpStatusCode.Forbidden)
                return Forbid();

            var json = response.Content.ReadAsStringAsync().Result;
            return Content(json, "application/json");
        }
    }
}

