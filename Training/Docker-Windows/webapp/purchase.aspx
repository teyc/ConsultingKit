<%@ Page Language="C#" AutoEventWireUp="true" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Net.Http" %>
<%@ Import Namespace="System.Net.Http.Headers" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Threading.Tasks" %>
<%@ Import Namespace="System.Runtime.Serialization" %>
<%@ Import Namespace="System.Runtime.Serialization.Json" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.HttpMethod == "POST")
        {
            var response = this.PurchasePolicyAsync().Result;
            this.policyreference.Text = response.PolicyReference;
        }

    }

    private async Task<PolicyPurchaseResponse> PurchasePolicyAsync()
    {
        var start = Convert.ToDateTime(Request.Form["start"]);
        var end = Convert.ToDateTime(Request.Form["end"]);
        var fullname = Request.Form["fullname"];
        var destination = Request.Form["destination"];

        var apiUrl = ConfigurationManager.AppSettings["api.url"];
        var client = new HttpClient();
        client.BaseAddress = new Uri(apiUrl);

        var json = "{ fullname: 'John West'}";      

        var requestSerializer = new DataContractJsonSerializer(typeof(PolicyPurchaseRequest), 
            new DataContractJsonSerializerSettings {
                DateTimeFormat = new DateTimeFormat("yyyy-MM-ddT00:00:00")
            });  
        using (var outputStream  = new MemoryStream())
        using (var reader = new StreamReader(outputStream))
        {
            requestSerializer.WriteObject(outputStream, new PolicyPurchaseRequest {
                Start = start,
                End = end,
                FullName = fullname,
                Destination = destination,
            });
            outputStream.Position = 0;
            json = reader.ReadToEnd();
        }
        
        var postContent = new StringContent(json);

        postContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");

        var responseSerializer = new DataContractJsonSerializer(typeof(PolicyPurchaseResponse), 
            new DataContractJsonSerializerSettings {
                DateTimeFormat = new DateTimeFormat("yyyy-MM-ddT00:00:00")
            });  
        var response = await client.PostAsync("api/policy/purchase", postContent);
        response.EnsureSuccessStatusCode();
        var result = await response.Content.ReadAsStringAsync();

        using (var reader = new MemoryStream(System.Text.Encoding.UTF8.GetBytes(result)))
        {
            var resultObject = (PolicyPurchaseResponse) responseSerializer.ReadObject(reader);
            return resultObject;
        }
    }
</script>
<form runat="server">

    <h1>Congratulations, you are set to travel.</h1>
    <h2>Your policy number is <asp:Label runat="server" id="policyreference" /></h2>
    
</form>