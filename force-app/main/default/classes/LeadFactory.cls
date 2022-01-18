global class LeadFactory extends GenericFactory{
    public override Schema.SObjectType getSObjectType(){
        return Opportunity.SObjectType;
    }
    public Opportunity makeLead(Map<SObjectField, Object> valuesByField){
        return (Opportunity) this.makeRecord(valuesByField);
    }
}