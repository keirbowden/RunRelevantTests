public with sharing class OpportunityEODViaInterface {
    public OpportunityEODViaInterface() {

    }

    public void EODProcessing() {
        List<Opportunity> opps=[select id, Name, Amount, CloseDate, StageName 
                                from Opportunity 
                                where CreatedDate=TODAY];

        OpportunityUtilsIF utils=UtilsFactory.GetOppUtils();

        List<Opportunity> bigDeals=utils.getBigDeals(opps);
        
        for (Opportunity bigDeal : bigDeals) {
            bigDeal.Name+=' - BIG DEAL';
        }

        update bigDeals;
    }
}