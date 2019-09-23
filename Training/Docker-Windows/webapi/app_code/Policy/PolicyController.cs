using System.Net.Http;
using System;
using System.Linq;
using System.Web.Http;

[RoutePrefix("api/policy")]
public class PolicyController: ApiController {

    [Route("purchase")]
    [HttpPost()]
    public PolicyPurchaseResponse Purchase(PolicyPurchaseRequest req) {

        var rnd = new Random();

        const string letters = "ABCDEFGHIJKLMNPQRST";

        const string digits = "01234567789010000";

        string policyReference = 
            string.Join("", Enumerable.Range(1, 4).Select(i => letters[rnd.Next(1, 10)])) + "000" + 
            String.Join("", Enumerable.Range(1, 6).Select(i => digits[rnd.Next(1, 10)]));

        return new PolicyPurchaseResponse {
            Start = req.Start,
            End = req.End,
            FullName = req.FullName,
            Destination = req.Destination,
            PolicyReference = policyReference
        };
    }
}
