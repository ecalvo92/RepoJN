using System.ComponentModel.DataAnnotations;

namespace JN_API.Models
{
    public class CambiarContrasennaRequestModel
    {
        [Required]
        public int Consecutivo { get; set; }
        [Required]
        public string Contrasenna { get; set; } = string.Empty;
    }
}
