using System.ComponentModel.DataAnnotations;

namespace JN_API.Models
{
    public class CambiarPerfilRequestModel
    {
        [Required]
        public int Consecutivo { get; set; }
        [Required]
        public string Identificacion { get; set; } = string.Empty;
        [Required]
        public string Nombre { get; set; } = string.Empty;
        [Required]
        public string CorreoElectronico { get; set; } = string.Empty;
    }
}
