using System.ComponentModel.DataAnnotations;

namespace JN_ProyectoAPI.Models
{
    public class ActualizarEmpresaRequestModel
    {
        [Required]
        public int ConsecutivoUsuario { get; set; }
        [Required]
        public string NombreComercial { get; set; } = string.Empty;
        [Required]
        public string ImagenComercial { get; set; } = string.Empty;
    }
}
