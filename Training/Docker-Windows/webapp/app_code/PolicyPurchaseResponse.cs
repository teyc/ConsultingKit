using System;

public class PolicyPurchaseResponse {
    public DateTime Start { get; set; }    
    public DateTime End { get; set; }
    public string Destination { get; set; }

    public string FullName { get; set; }

    public string PolicyReference { get; set; }
}