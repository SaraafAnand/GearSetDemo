public class LeadConvert {

    public static void afterupdate(list<Lead> ldList){
        for(lead myLead:ldList){
      if((myLead.isconverted==false) && (myLead.leadsource == 'web') ) {

Database.LeadConvert lc = new database.LeadConvert();

       lc.setLeadId(myLead.Id);

       lc.convertedStatus = 'Closed - Converted';

       //Database.ConvertLead(lc,true);

       lc.setDoNotCreateOpportunity(false);

       Database.LeadConvertResult lcr = Database.convertLead(lc);

       System.assert(lcr.isSuccess());

       }
}
       }  
    }