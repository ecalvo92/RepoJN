namespace JN_ProyectoAPI.Models
{
    public class DatosProductoResponseModel
    {
        public int ConsecutivoProducto { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public decimal Precio { get; set; }
        public bool Estado { get; set; }
        public string Imagen { get; set; } = string.Empty;
    }
}
