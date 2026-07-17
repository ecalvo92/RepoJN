using MailKit.Net.Smtp;
using MailKit.Security;
using MimeKit;
using System.IdentityModel.Tokens.Jwt;

namespace JN_API.Services
{
    public class UtilesService(IConfiguration _config) : IUtilesService
    {
        public string GenerarContrasena()
        {
            return Guid.NewGuid().ToString("N")[..10];
        }

        public async Task EnviarCorreoAsync(string destinatario, string asunto, string cuerpoHtml)
        {
            var mensaje = new MimeMessage();
            var cuentaGmail = _config["Correos:CuentaGmail"]!;
            var contrasenaAplicacion = _config["Correos:ContrasenaAplicacion"]!;

            if (string.IsNullOrEmpty(contrasenaAplicacion))
                return;

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

        public string GenerarToken(int consecutivo)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = System.Text.Encoding.ASCII.GetBytes(_config["Jwt:SecretKey"]!);
            var tokenDescriptor = new Microsoft.IdentityModel.Tokens.SecurityTokenDescriptor
            {
                Subject = new System.Security.Claims.ClaimsIdentity(new[]
                {
                    new System.Security.Claims.Claim("consecutivo", consecutivo.ToString())
                }),
                Expires = DateTime.UtcNow.AddMinutes(30),
                SigningCredentials = new Microsoft.IdentityModel.Tokens.SigningCredentials(
                    new Microsoft.IdentityModel.Tokens.SymmetricSecurityKey(key),
                    Microsoft.IdentityModel.Tokens.SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }

    }
}
