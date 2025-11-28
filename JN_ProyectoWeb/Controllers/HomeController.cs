using JN_ProyectoWeb.Models;
using Microsoft.AspNetCore.Mvc;
using System.Net.Http.Headers;
using System.Security.Cryptography;
using System.Text;
using Utiles;

namespace JN_ProyectoWeb.Controllers
{
    public class HomeController : Controller
    {
        private readonly IHttpClientFactory _http;
        private readonly IConfiguration _configuration;
        public HomeController(IHttpClientFactory http, IConfiguration configuration)
        {
            _http = http;
            _configuration = configuration;
        }

        #region Actions de Iniciar Sesión

        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Index(UsuarioModel usuario)
        {
            var helper = new Helper();
            usuario.Contrasenna = helper.Encrypt(usuario.Contrasenna);
            using (var context = _http.CreateClient())
            {
                var urlApi = _configuration["Valores:UrlAPI"] + "Home/ValidarSesion";
                var respuesta = context.PostAsJsonAsync(urlApi, usuario).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    var datosApi = respuesta.Content.ReadFromJsonAsync<UsuarioModel>().Result;

                    if (datosApi != null)
                    {
                        HttpContext.Session.SetInt32("ConsecutivoUsuario", datosApi.ConsecutivoUsuario);
                        HttpContext.Session.SetString("NombreUsuario", datosApi.Nombre);
                        HttpContext.Session.SetString("NombrePerfil", datosApi.NombrePerfil);
                        HttpContext.Session.SetInt32("ConsecutivoPerfil", datosApi.ConsecutivoPerfil);
                        HttpContext.Session.SetString("Token", datosApi.Token);
                        return RedirectToAction("Principal", "Home");
                    }
                }

                ViewBag.Mensaje = "No se ha validado la información";
                return View();
            }
        }

        #endregion

        #region Actions de Registrar Usuario

        [HttpGet]
        public IActionResult Registro()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Registro(UsuarioModel usuario)
        {
            var helper = new Helper();
            usuario.Contrasenna = helper.Encrypt(usuario.Contrasenna);
            using (var context = _http.CreateClient())
            {
                var urlApi = _configuration["Valores:UrlAPI"] + "Home/Registro";
                var respuesta = context.PostAsJsonAsync(urlApi, usuario).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    var datosApi = respuesta.Content.ReadFromJsonAsync<int>().Result;

                    if (datosApi > 0)
                        return RedirectToAction("Index", "Home");
                }

                ViewBag.Mensaje = "No se ha registrado la información";
                return View();
            }
        }

        #endregion

        #region Actions de Recuperar Acceso

        [HttpGet]
        public IActionResult RecuperarAcceso()
        {
            return View();
        }

        [HttpPost]
        public IActionResult RecuperarAcceso(UsuarioModel usuario)
        {
            using (var context = _http.CreateClient())
            {
                var urlApi = _configuration["Valores:UrlAPI"] + "Home/ValidarUsuario?CorreoElectronico=" + usuario.CorreoElectronico;
                var respuesta = context.GetAsync(urlApi).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    var datosApi = respuesta.Content.ReadFromJsonAsync<UsuarioModel>().Result;

                    if (datosApi != null)
                        return RedirectToAction("Index", "Home");
                }

                ViewBag.Mensaje = "No se ha recuperado el acceso";
                return View();
            }
        }

        #endregion

        [Seguridad]
        [HttpGet]
        public IActionResult Principal()
        {
            using var context = _http.CreateClient();
            var urlApi = _configuration["Valores:UrlAPI"] + "Usuario/ConsultarUsuarios";

            context.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", HttpContext.Session.GetString("Token"));
            var respuesta = context.GetAsync(urlApi).Result;

            if (respuesta.IsSuccessStatusCode)
            {
                var datosApi = respuesta.Content.ReadFromJsonAsync<List<UsuarioModel>>().Result;
                return View(datosApi);
            }

            ViewBag.Mensaje = "No hay usuarios registrados";
            return View(new List<UsuarioModel>());

        }

        [Seguridad]
        [HttpGet]
        public IActionResult CerrarSesion()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index", "Home");
        }

    }
}
