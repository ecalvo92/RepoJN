using Microsoft.AspNetCore.Mvc;

namespace JN_API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class WeatherForecastController : ControllerBase
    {
        [HttpGet(Name = "GetWeatherForecast")]
        public int Get()
        {
            return 10;
        }
    }
}
