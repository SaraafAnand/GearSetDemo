public abstract class GenericFactory{
    public SObject makeRecord(Map<SObjectField, Object> valuesByField) {
        // Initialize the Lead object to return
        SObject record = this.getSObjectType().newSObject(null, true);

        // Populate the record with values passed to the method
        for (SObjectField eachField : valuesByField.keySet()) {
            record.put(eachField, valuesByField.get(eachField));
        }
System.debug(record);
        // Return the Lead record
        return record;
    }
    public abstract Schema.SObjectType getSObjectType();
}