using System.ComponentModel.DataAnnotations;

namespace JN_ProyectoAPI.Models
{
    public class UsuarioModel
    {
        [Required]
        public string Identificacion { get; set; } = string.Empty;
        public string Nombre { get; set; } = string.Empty;
        public string CorreoElectronico { get; set; } = string.Empty;
        public string Contrasenna { get; set; } = string.Empty;
    }
}
