public with sharing class OpportunityEODDynamic {
    public OpportunityEODDynamic() {

    }

    public void EODProcessing() {
        List<Opportunity> opps=[select id, Name, Amount, CloseDate, StageName 
                                from Opportunity 
                                where CreatedDate=TODAY];

        Type oppUtilType=Type.forName('OpportunityUtils');
        OpportunityUtilsIF utils=(OpportunityUtilsIF) oppUtilType.newInstance();

        List<Opportunity> bigDeals=utils.getBigDeals(opps);
        
        for (Opportunity bigDeal : bigDeals) {
            bigDeal.Name+=' - BIG DEAL';
        }

        update bigDeals;
    }
}