using System.ComponentModel.DataAnnotations;

namespace JN_API.Models
{
    public class RecuperarAccesoRequestModel
    {
        [Required]
        public string CorreoElectronico { get; set; } = string.Empty;
    }
}
