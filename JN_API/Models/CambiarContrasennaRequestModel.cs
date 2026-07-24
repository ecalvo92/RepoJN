using System.ComponentModel.DataAnnotations;

namespace JN_API.Models
{
    public class CambiarContrasennaRequestModel
    {
        [Required]
        public string Contrasenna { get; set; } = string.Empty;
    }
}
