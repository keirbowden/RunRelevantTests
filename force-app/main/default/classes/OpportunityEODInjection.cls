public with sharing class OpportunityEODInjection {
    public OpportunityEODInjection() {

    }

    public void EODProcessing(OpportunityUtilsIF oppUtils) {
        List<Opportunity> opps=[select id, Name, Amount, CloseDate, StageName 
                                from Opportunity 
                                where CreatedDate=TODAY];

        List<Opportunity> bigDeals=oppUtils.getBigDeals(opps);
        
        for (Opportunity bigDeal : bigDeals) {
            bigDeal.Name+=' - BIG DEAL';
        }

        update bigDeals;
    }

}