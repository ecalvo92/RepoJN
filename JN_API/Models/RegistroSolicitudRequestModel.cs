namespace JN_API.Models
{
    public class RegistroSolicitudRequestModel
    {
        public string Titulo { get; set; } = string.Empty;
        public string Descripcion { get; set; } = string.Empty;
        public int ConsecutivoAdmin { get; set; }
    }
}
