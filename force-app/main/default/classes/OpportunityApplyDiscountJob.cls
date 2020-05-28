public with sharing class OpportunityApplyDiscountJob implements Database.Batchable<SObject> {
    public Decimal DiscountPercentage {get; private set;}
    public OpportunityApplyDiscountJob(Decimal discountPercentage) {
        // Discount to apply in this job
        this.DiscountPercentage = discountPercentage;
    }

    public Database.QueryLocator start(Database.BatchableContext ctx) {
        // Opportunities to discount
        return Database.getQueryLocator(
            'select Id from Opportunity where StageName = \'Negotiation/Review\''); 
    }

    public void execute(Database.BatchableContext BC, List<SObject> scope) {
        try {
            // Call the service           
            OpportunitiesService.applyDiscounts(
              new Map<Id,SObject>(scope).keySet(),DiscountPercentage);
        } catch (Exception e) {
              // Email error, log error, chatter error etc..
        }
    }

    public void finish(Database.BatchableContext ctx) { }
}