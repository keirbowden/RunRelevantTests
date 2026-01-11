@isTest
private class OpportunityEODWrapLevel1Test {
    @isTest
    static void TestEODProcessing() {
        List<Opportunity> opps=new List<Opportunity>();
        for (Integer idx=0; idx<20; idx++) {
            Decimal amount=100000 + (Math.Random()*200000);
            opps.add(TestDataFactory.GetOpportunity('Test'+idx, amount, 'Prospecting', Date.today()));
        }
        insert opps;

        Test.startTest();
        OpportunityEODWrapLevel1 eodWrap=new OpportunityEODWrapLevel1();
        eodWrap.EODProcessingWrapLevel1();
        Test.stopTest();

        List<Opportunity> bigDeals=[select Id, Name, Amount 
                                    from Opportunity
                                    where Amount>=250000];

        for (Opportunity bigDeal : bigDeals) {
            System.Assert.isTrue(bigDeal.Name.contains(' - BIG DEAL'), 'Name should contain " - BIG DEAL"');
        }
    }
}