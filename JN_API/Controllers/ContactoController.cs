using Dapper;
using JN_API.Models;
using JN_API.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;

namespace JN_API.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class ContactoController(IConfiguration _config, IUtilesService _utiles) : ControllerBase
    {
        [HttpGet("ConsultarSolicitudesChatAPI")]
        public IActionResult ConsultarSolicitudesChatAPI()
        {
            using var context = new SqlConnection(_config["ConnectionStrings:DefaultConnection"]);

            var consecutivo = _utiles.ObtenerConsecutivoToken();
            var consecutivoRol = _utiles.ObtenerConsecutivoRolToken();

            var parameters = new DynamicParameters();
            parameters.Add("@ConsecutivoUsuario", consecutivo);
            parameters.Add("@ConsecutivoRol", consecutivoRol);
            var response = context.Query<SolicitudChatResponseModel>("spConsultarSolicitudesAbiertas", parameters,
                commandType: System.Data.CommandType.StoredProcedure);

            if (response.Any())
                return Ok(response);

            return NotFound("No hay solicitudes abiertas en este momento.");
        }

        [HttpGet("ConsultarMensajesAPI")]
        public IActionResult ConsultarMensajesAPI(int consecutivoSolicitud)
        {
            using var context = new SqlConnection(_config["ConnectionStrings:DefaultConnection"]);

            var acceso = context.QuerySingle<int>("spValidarAccesoSolicitud",
                new { ConsecutivoSolicitud = consecutivoSolicitud, ConsecutivoUsuario = _utiles.ObtenerConsecutivoToken() },
                commandType: System.Data.CommandType.StoredProcedure);

            if (acceso == 0)
                return Forbid();

            var parameters = new DynamicParameters();
            parameters.Add("@ConsecutivoSolicitud", consecutivoSolicitud);
            var response = context.Query<MensajeResponseModel>("spConsultarMensajes", parameters,
                commandType: System.Data.CommandType.StoredProcedure);

            return Ok(response);
        }
    }
}

