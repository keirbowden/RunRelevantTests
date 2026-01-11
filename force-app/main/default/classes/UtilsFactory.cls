public with sharing class UtilsFactory {
    public static OpportunityUtilsIF GetOppUtils() {
        return new OpportunityUtils();
    }
}