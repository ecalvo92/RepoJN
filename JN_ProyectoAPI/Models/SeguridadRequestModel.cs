using System.ComponentModel.DataAnnotations;

namespace JN_ProyectoAPI.Models
{
    public class SeguridadRequestModel
    {
        [Required]
        public int ConsecutivoUsuario { get; set; }
        [Required]
        public string Contrasenna { get; set; } = string.Empty;
    }
}
