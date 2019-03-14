    [RoutePrefix("api/health-check")]
    public class HealthCheckController : ApiController
    {
        [HttpGet]
        [Route("")]
        public async Task<HttpResponseMessage> Index()
        {
            var thisName =
                $"{Assembly.GetExecutingAssembly().FullName} - {ConfigurationManager.AppSettings["Environment"]}";

            var thisInstance = new Uri(Request.RequestUri, "../..").ToString();

            var xHealthCheckHeaders = Request.Headers.XHealthCheck();

            var healthCheckResponseDto =
                HealthCheckHelper.IsRecursiveHealthCheck(thisName, thisInstance, xHealthCheckHeaders) ??
                new HealthCheckResponseDto
                {
                    Name = thisName,
                    Instance = thisInstance,
                    Subsystems = new[]
                    {
                        await HealthCheckHelper.CheckOracleDatabase(),
                        await HealthCheckHelper.CheckHealthCheckEndpoint("MicroDataService2",
                            ConfigurationManager.AppSettings["dataService:baseUrl"] + "/api/health-check", xHealthCheckHeaders, thisName)
                    }
                };

            var status = healthCheckResponseDto.Subsystems.All(subsystem =>
                subsystem.Status == HealthCheckResponseDto.HealthCheckStatus.Ok)
                ? HttpStatusCode.OK
                : HttpStatusCode.ServiceUnavailable;

            return Request.CreateResponse(status, healthCheckResponseDto);
        }
