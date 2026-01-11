@isTest
private class OpportunityUtilsTest {
    @isTest
    static void TestZeroBigDeals() {
        List<Opportunity> opps=new List<Opportunity>();
        for (Integer idx=0; idx<20; idx++) {
            opps.add(TestDataFactory.GetOpportunity('Test'+idx, 100000, 'Prospecting', Date.today()));
        }

        Test.startTest();
        OpportunityUtils utils=new OpportunityUtils();
        List<Opportunity> bigDeals=utils.getBigDeals(opps);
        Test.stopTest();

        Assert.areEqual(0, bigDeals.size(), 'There should be no big deals');
    }

    @isTest
    static void TestOneBigDeal() {
        List<Opportunity> opps=new List<Opportunity>();
        for (Integer idx=0; idx<20; idx++) {
            Decimal amount=100000;
            if (10==idx) {
                amount=275000;
            }
            opps.add(TestDataFactory.GetOpportunity('Test'+idx, amount, 'Prospecting', Date.today()));
        }

        Test.startTest();
        OpportunityUtils utils=new OpportunityUtils();
        List<Opportunity> bigDeals=utils.getBigDeals(opps);
        Test.stopTest();

        Assert.areEqual(1, bigDeals.size(), 'There should be exactly one big deal');
    }
}