using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace JN_API.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class ContactoController : ControllerBase
    {

    }
}
