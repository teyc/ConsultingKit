<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="System.Net.Http" %>
<%@ Import Namespace="System.Web.Http" %>

<script runat="server">
protected void Application_Start()
{
    // Default stuff
    //AreaRegistration.RegisterAllAreas();

    // Manually installed WebAPI 2.2 after making an MVC project.
    //GlobalConfiguration.Configure(WebApiConfig.Register); // NEW way
    
    var config = System.Web.Http.GlobalConfiguration.Configuration;

    config.MapHttpAttributeRoutes();

    config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = System.Web.Http.RouteParameter.Optional }
            );

    config.EnsureInitialized();
    
    // Default stuff
    //FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
    //RouteConfig.RegisterRoutes(RouteTable.Routes);
    //BundleConfig.RegisterBundles(BundleTable.Bundles);
}
</script>