@isTest
public class TestDataFactory {
    public static Opportunity GetOpportunity(String name, Decimal amount, String stage, Date closeDate) {    
        return new Opportunity(
            Name=name,
            Amount=amount,
            StageName=stage,
            CloseDate=closeDate
        );
    }
}