using JN_WEB.Models;
using Microsoft.AspNetCore.Components.Rendering;
using Microsoft.AspNetCore.Mvc;
using System.Net;

namespace JN_WEB.Controllers
{
    public class HomeController(
        IHttpClientFactory _http, 
        IConfiguration _config) : Controller
    {
        #region Iniciar Sesión

        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Index(UsuarioModel model)
        {
            using var client = _http.CreateClient();
            var url = _config["Valores:UrlApi"] + "Home/IniciarSesionAPI";
            var response = client.PostAsJsonAsync(url, model).Result;

            if (response.StatusCode == HttpStatusCode.OK)
            { 
                return RedirectToAction("Principal", "Home");
            }
            else if(response.StatusCode == HttpStatusCode.NotFound)
            {
                //Mensaje
                return View();
            }

            throw new Exception("Error al iniciar sesión");
        }

        #endregion

        #region Registrar Usuario

        [HttpGet]
        public IActionResult Registrar()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Registrar(UsuarioModel model)
        {
            using var client = _http.CreateClient();
            var url = _config["Valores:UrlApi"] + "Home/RegistrarAPI";
            var response = client.PostAsJsonAsync(url, model).Result;
            return View();
        }

        #endregion

        public IActionResult RecuperarAcceso()
        {
            return View();
        }

        public IActionResult Principal()
        {
            return View();
        }

    }
}
