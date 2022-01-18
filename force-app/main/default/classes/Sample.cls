global class Sample
{   
    public String idOfRec {get;set;}
   
   
    webservice static void cloneRec()
    {
        Id id = apexpages.currentpage().getparameters().get('id');
System.debug('Id'+id);
        List<Contact> cons = new List<Contact>();
        Account acc = [SELECT ID, Name FROM Account WHERE Id = : id];
        Account accCopy = acc.clone(false,true);
        insert accCopy;
        List<Contact> con = [SELECT Id, LastName, AccountId FROM Contact WHERE AccountId = : acc.Id];
        for(Contact c : con)
        {
            Contact conCopy = c.clone(false,true);
            conCopy.AccountId = accCopy.Id;
            cons.add(conCopy);
        }
        insert cons;
    }
}