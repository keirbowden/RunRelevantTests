public with sharing class OpportunityEOD {
    public OpportunityEOD() {

    }

    public void EODProcessing() {
        List<Opportunity> opps=[select id, Name, Amount, CloseDate, StageName 
                                from Opportunity 
                                where CreatedDate=TODAY];

        OpportunityUtilsIF utils=new OpportunityUtils();

        List<Opportunity> bigDeals=utils.getBigDeals(opps);
        for (Opportunity bigDeal : bigDeals) {
            bigDeal.Name+=' - BIG DEAL';
        }

        update bigDeals;
    }
}