using System.ComponentModel.DataAnnotations;

namespace JN_ProyectoAPI.Models
{
    public class RegistroCalificacionRequestModel
    {
        [Required]
        public int RatingValue { get; set; }
        public string Resenna { get; set; } = string.Empty;
        [Required]
        public int ConsecutivoProducto { get; set; }
    }
}
