/* Author:S.Anand
 * Version:40.0
 * Requirement:when a user is deactivated , assign all the opportunities own by this user to wilson
 * CreatedDate:04/10/2017
*/
public class UserDeactivation {
    @future
    public static void User_afterUpdate(){
        // Get the active user to whom account need to be assigned
        user activeUser=[select id from user where alias=:'wils'];
        List<user> users=[select id,IsActive from user];
        List<Id> deactiveIds = new List<Id>();
        
        List<Account> updatedAccounts=new List<Account>();
        for(user deactiveUser:users){
            //for each deactive user check If user is deactivated or not
            System.debug('====>>>>deactiveUserId:'+deactiveUser.id);
            if(deactiveUser.isActive==false){
                deactiveIds.add(deactiveUser.id);  
            }
        }
             //  For each account if account owner id and deactiveuser id are equal then record is assigned to activeUser 
            List<Account> accountList=[select id,name,ownerid from Account where ownerid in:deactiveIds];
                for(Account updateAccount:accountList){
                   
                        updateAccount.ownerid=activeUser.Id;
                        system.debug('====>>>updatedAccountOwner'+updateAccount.ownerid);
                        updatedAccounts.add(updateAccount);
                    
                }
                
            
            update updatedAccounts;
        }
    }