trigger QuoteLineItem on QuoteLineItem (after insert,after update) {
    Map<id,Id> quoteLineMap=new Map<id,Id>();
    set<id> quoteIds=new Set<id>();
    for(QuoteLineItem qli:trigger.new){
        quoteIds.add(qli.quoteId);
        System.debug('qliId'+qli.quoteId);
    }
    System.debug('set'+quoteIds.size());
    Map<ID,ID> mapQuoteLineItemSortOrder= returnDefaultLinking(quoteIds);
    System.debug('mapQuoteLineItemSortOrder=====>>'+mapQuoteLineItemSortOrder.size());
    //Fetch opportunity line item for sync
    Map<ID,OpportunityLineItem> mapOppLineItems=new Map<ID,OpportunityLineItem>();
    for(OpportunityLineItem oli:[select id, term__c from OpportunityLineItem where Opportunity.SyncedQuoteId in :quoteIds])
    {
        mapOppLineItems.put(oli.id,oli);
    }
    System.debug('mapOppLineItems'+mapOppLineItems);
    List<OpportunityLineItem> lstOppotunityToUpdate = new List<OpportunityLineItem>();
    for (QuoteLineItem qli :trigger.new) {
        OpportunityLineItem oli = mapOppLineItems.get(mapQuoteLineItemSortOrder.get(qli.Id));
        if (oli != null ) {
            oli.term__c=qli.term__c;
            //update more fields....
            System.debug('oliterm'+oli.Term__c);
            lstOppotunityToUpdate.add(oli);
        }
    }
    update lstOppotunityToUpdate;
    
    
    
    private static Map<ID,ID> returnDefaultLinking(Set<ID> poIds)
    {
        System.debug('Insideme'+poIds);
        Map<ID,ID> mapSortOrder= new Map<ID,ID>();
        List<quote>   lstQuotesWithLineItems=[select id, name,(select id,OpportunityLineItem_Id__c from QuoteLineItems) from Quote where id in :poIds];
        System.debug('lst'+lstQuotesWithLineItems);
        for(Quote q: lstQuotesWithLineItems)
        {
            System.debug('quote'+q);
            if(q.QuoteLineItems !=null)
            {
                for(QuoteLineitem qli : q.QuoteLineItems)
                {
                    if(qli.OpportunityLineItem_Id__c!=null)
                    {
                        System.debug('oli');
                        //map quote line item id with respective opportunity line item id
                        mapSortOrder.put(qli.Id,ID.valueOF(qli.OpportunityLineItem_Id__c));
                    } 
                }
            }
        }
        return mapSortOrder;
    }
    
    
}