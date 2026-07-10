using Dapper;
using JN_API.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using MimeKit;
using MailKit.Security;
using MailKit.Net.Smtp;

namespace JN_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HomeController(IConfiguration _config) : ControllerBase
    {

        [HttpPost("RegistrarAPI")]
        public IActionResult RegistrarAPI(RegistroUsuarioRequestModel model)
        {
            using var context = new SqlConnection(_config["ConnectionStrings:DefaultConnection"]);

            var parameters = new DynamicParameters();
            parameters.Add("@Identificacion", model.Identificacion);
            parameters.Add("@Nombre", model.Nombre);
            parameters.Add("@CorreoElectronico", model.CorreoElectronico);
            parameters.Add("@Contrasenna", model.Contrasenna);
            var response = context.Execute("spRegistrarUsuario", parameters);

            if (response > 0)
                return Ok(response);

            return BadRequest("No se ha registrado su información, valide que no tenga una cuenta ya creada");
        }

        [HttpPost("IniciarSesionAPI")]
        public IActionResult IniciarSesionAPI(InicioSesionUsuarioRequestModel model)
        {
            using var context = new SqlConnection(_config["ConnectionStrings:DefaultConnection"]);

            var parameters = new DynamicParameters();
            parameters.Add("@CorreoElectronico", model.CorreoElectronico);
            parameters.Add("@Contrasenna", model.Contrasenna);
            var response = context.QueryFirstOrDefault<UsuarioResponseModel>("spIniciarSesionUsuario", parameters);

            if (response != null)
                return Ok(response);
            else
                return NotFound("No se ha validado su información correctamente");
        }

        [HttpPost("RecuperarAccesoAPI")]
        public async Task<IActionResult> RecuperarAccesoAPI(RecuperarAccesoRequestModel model) 
        {
            using var context = new SqlConnection(_config["ConnectionStrings:DefaultConnection"]);

            var parameters = new DynamicParameters();
            parameters.Add("@CorreoElectronico", model.CorreoElectronico);
            var response = context.QueryFirstOrDefault<UsuarioResponseModel>("spValidarCorreo", parameters);

            if (response == null)
                return NotFound("No se ha validado su información correctamente");

            //2. Generar una contraseña temporal
            var temporal = GenerarContrasena();

            parameters = new DynamicParameters();
            parameters.Add("@Consecutivo", response.Consecutivo);
            parameters.Add("@Contrasenna", temporal);
            parameters.Add("@IndicadorTemp", true);
            var update = context.Execute("spActualizarContrasenna", parameters);

            if (update > 0)
            {
                //3. Enviar la contraseña temporal al correo electrónico del usuario
                string ruta = Path.Combine(AppContext.BaseDirectory, "Templates", "RecuperarAcceso.html");
                string plantilla = System.IO.File.ReadAllText(ruta);

                plantilla = plantilla.Replace("{{TEMPORAL}}", temporal);
                plantilla = plantilla.Replace("{{NOMBRE}}", response.Nombre);

                await EnviarCorreoAsync(model.CorreoElectronico, "Recuperación de acceso", plantilla);
                return Ok(response);
            }

            return BadRequest("No se ha recuperado su acceso, intente nuevamente más tarde");
        }

        private static string GenerarContrasena()
        {
            return Guid.NewGuid().ToString("N")[..10];
        }

        public async Task EnviarCorreoAsync(string destinatario, string asunto, string cuerpoHtml)
        {
            var mensaje = new MimeMessage();
            var cuentaGmail = _config["Correos:CuentaGmail"]!;
            var contrasenaAplicacion = _config["Correos:ContrasenaAplicacion"]!;

            mensaje.From.Add(new MailboxAddress(string.Empty, cuentaGmail));
            mensaje.To.Add(MailboxAddress.Parse(destinatario));
            mensaje.Subject = asunto;

            mensaje.Body = new TextPart("html")
            {
                Text = cuerpoHtml
            };

            using var cliente = new SmtpClient();

            try
            {
                await cliente.ConnectAsync("smtp.gmail.com", 587, SecureSocketOptions.StartTls);
                await cliente.AuthenticateAsync(cuentaGmail, contrasenaAplicacion);
                await cliente.SendAsync(mensaje);
            }
            finally
            {
                await cliente.DisconnectAsync(true);
            }
        }
    }
}
