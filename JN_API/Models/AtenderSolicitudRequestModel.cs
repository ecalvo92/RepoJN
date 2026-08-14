using System.ComponentModel.DataAnnotations;

namespace JN_API.Models
{
    public class AtenderSolicitudRequestModel
    {
        [Required]
        public int ConsecutivoSolicitud { get; set; }
        [Required]
        public string Solucion { get; set; } = string.Empty;
    }
}
