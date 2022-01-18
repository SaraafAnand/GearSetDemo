/* Author:S.Anand
* Version:40.0
* Requirement:Update lead rating as hot whenever new lead is created
* CreatedDate:04/10/2017
*/
public class LeadHandler { 
    public static void leadRating_Update(List<Lead> LeadList){
        List<Lead> leads=new List<Lead>();
        // for each lead in the trigger.new update rating as hot
        for(Lead leadUpdate:LeadList){
            leadUpdate.rating='Hot'; 
            system.debug('rating====>>>'+leadUpdate.rating);
        }
    }
}