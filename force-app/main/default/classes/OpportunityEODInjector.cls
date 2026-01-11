public with sharing class OpportunityEODInjector {
    public OpportunityEODInjector() {
        OpportunityUtilsIF oppUtils=new OpportunityUtils();

        OpportunityEODInjection oppEODInj=new OpportunityEODInjection();
        oppEODInj.EODProcessing(oppUtils);
    }
}