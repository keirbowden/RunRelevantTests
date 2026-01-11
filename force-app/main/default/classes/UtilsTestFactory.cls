@isTest
public class UtilsTestFactory {
    public static OpportunityUtilsIF GetOppUtils() {
        Type oppUtilType=Type.forName('OpportunityUtils');
        OpportunityUtilsIF utils=(OpportunityUtilsIF) oppUtilType.newInstance();

        return utils;
    }
}