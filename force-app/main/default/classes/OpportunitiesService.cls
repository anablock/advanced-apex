public with sharing class OpportunitiesService {
    public static void applyDiscounts(Set<Id> opportunityIds, Decimal discountPercentage) {
        // Validate parameters
        if(opportunityIds == null || opportunityIds.size() == 0) {
            throw new OpportunityServiceException('Opportunities not specified.');
        }
        if(discountPercentage < 0 || discountPercentage > 100) {
            throw new OpportunityServiceException('Invalid discount to apply.');
        }
        // Query Opportunities and Lines
        List<Opportunity> opportunities = 
            [SELECT Amount, (SELECT UnitPrice FROM OpportunityLineItems)
            FROM Opportunity 
            WHERE Id IN :opportunityIds];
        // Update Opportunities and Lines (if present)
        
    }
}