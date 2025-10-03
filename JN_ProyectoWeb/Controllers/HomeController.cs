using JN_ProyectoWeb.Models;
using Microsoft.AspNetCore.Mvc;

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
            //ToDo: Validar si existe en la BD

            return View();
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
            using (var context = _http.CreateClient())
            {
                var urlApi = _configuration["Valores:UrlAPI"] + "Home/Registro";
                var respuesta = context.PostAsJsonAsync(urlApi, usuario).Result;

                if (respuesta.IsSuccessStatusCode)
                { 
                
                }
            }

            return View();
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
            //ToDo: validar la información del usuario en la BD y enviarle un correo

            return View();
        }

        #endregion

        [HttpGet]
        public IActionResult Principal()
        {
            return View();
        }
    }
}
