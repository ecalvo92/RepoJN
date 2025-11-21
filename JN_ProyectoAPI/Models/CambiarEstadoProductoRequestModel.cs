using System.ComponentModel.DataAnnotations;

namespace JN_ProyectoAPI.Models
{
    public class CambiarEstadoProductoRequestModel
    {
        [Required]
        public int ConsecutivoProducto { get; set; }
    }
}
