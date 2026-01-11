public with sharing class OpportunityUtils implements OpportunityUtilsIF {

    public static Double BIG_DEAL_AMOUNT=300000;

    public OpportunityUtils() {
    }

    public List<Opportunity> getBigDeals(List<Opportunity> candidates) {
        List<Opportunity> bigDeals=new List<Opportunity>();

        for (Opportunity candidate: candidates) {
            if (candidate.Amount>=BIG_DEAL_AMOUNT) {
                bigDeals.add(candidate);
            }
        }

        return bigDeals;
    }
}