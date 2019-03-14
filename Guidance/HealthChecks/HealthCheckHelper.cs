using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace Sample.HealthChecks
{
    public static class HealthCheckHelper
    {
        /// <summary>
        /// Add your service name to the header to prevent recursive health checks
        /// </summary>
        public const string HealthCheckHeaderName = "X-HealthCheck";

        [MethodImpl(MethodImplOptions.NoOptimization | MethodImplOptions.NoInlining)]
        public static Task<HealthCheckResponseDto> CheckOracleDatabase()
        {
            var instanceDescription = ConfigurationManager.ConnectionStrings["ADO.Net.Oracle"].HideSensitive();

            try
            {
                var adapterJobDao = new AdapterJobDao();
                var list = adapterJobDao.ListAdapterJobByUrgentlyJobId("");
                return Task.FromResult(new HealthCheckResponseDto
                {
                    Name = "Oracle database",
                    Instance = instanceDescription
                });
            }
            catch (Exception e)
            {
                return Task.FromResult(new HealthCheckResponseDto
                {
                    Name = "Oracle database",
                    Instance = instanceDescription,
                    ExceptionMessage = e.Message
                });
            }
        }

        /// <summary>
        /// <code>X-HealthCheck</code> contains a list of health check services that has been called
        /// </summary>
        /// <param name="headers"></param>
        /// <returns></returns>
        public static string[] XHealthCheck(this HttpRequestHeaders headers)
        {
            return headers.TryGetValues(HealthCheckHeaderName, out var xHealthCheckHeaders) ? xHealthCheckHeaders.ToArray() : Array.Empty<string>();
        }

        /// <summary>
        /// Always check your headers in case you are called recursively
        /// </summary>
        /// <param name="thisName"></param>
        /// <param name="thisInstance"></param>
        /// <param name="xHealthCheckHeaders"></param>
        /// <returns></returns>
        public static HealthCheckResponseDto IsRecursiveHealthCheck(string thisName, string thisInstance,
            IEnumerable<string> xHealthCheckHeaders)
        {
            return xHealthCheckHeaders != null && xHealthCheckHeaders.Contains(thisName)
                ? new HealthCheckResponseDto
                {
                    Name = thisName,
                    Instance = thisInstance,
                    Note = "Recursive health check",
                    Subsystems = new HealthCheckResponseDto[] { }
                }
                : null;
        }

        public static async Task<HealthCheckResponseDto> CheckHttpEndpoint(string name, string url)
        {
            var instanceDescription = url;
            try
            {
                var client = new HttpClient();
                var response = await client.GetStringAsync(url);

                return new HealthCheckResponseDto
                {
                    Name = name,
                    Instance = instanceDescription,
                    ExceptionMessage = null
                };
            }
            catch (Exception e)
            {
                return new HealthCheckResponseDto
                {
                    Name = name,
                    Instance = instanceDescription,
                    ExceptionMessage = e.Message
                };
            }
        }

        /// <summary>
        /// Calls another health check endpoint
        /// </summary>
        /// <param name="name"></param>
        /// <param name="url"></param>
        /// <param name="xHealthCheckHeaders">Pass list of X-HealthCheck headers to prevent recursive calls.</param>
        /// <returns></returns>
        public static async Task<HealthCheckResponseDto> CheckHealthCheckEndpoint(
            string name, string url, IEnumerable<string> xHealthCheckHeaders, string callerName)
        {
            var instanceDescription = url;
            try
            {
                var client = new HttpClient();

                client.DefaultRequestHeaders.Add(HealthCheckHeaderName, xHealthCheckHeaders);

                client.DefaultRequestHeaders.Add(HealthCheckHeaderName, callerName);

                var response = await client.GetAsync(url);

                return new HealthCheckResponseDto
                {
                    Name = name,
                    Instance = url,
                    Subsystems = new[]
                    {
                        JsonConvert.DeserializeObject<HealthCheckResponseDto>(
                            await response.Content.ReadAsStringAsync())
                    }
                };
            }
            catch (Exception e)
            {
                return new HealthCheckResponseDto
                {
                    Name = name,
                    Instance = instanceDescription,
                    ExceptionMessage = e.Message
                };
            }
        }
    }
}
