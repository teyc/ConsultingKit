using System.Net.Http;
using System.Web.Http;

[RoutePrefix("api/policy")]
public class PolicyController: ApiController {

    [Route("purchase")]
    [HttpPost()]
    public PolicyPurchaseResponse Purchase(PolicyPurchaseRequest req) {

        string policyReference = "asdfasdf";

        return new PolicyPurchaseResponse {
            Start = req.Start,
            End = req.End,
            FullName = req.FullName,
            Destination = req.Destination,
            PolicyReference = policyReference
        };
    }
}
