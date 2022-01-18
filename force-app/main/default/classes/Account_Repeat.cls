/* Author:S.Anand
* Version:40.0
* Requirement:write a soql query on Account and fetch all the account records and display in the vf page using repeat. 
* CreatedDate:04/10/2017
*/
public class Account_Repeat {
    public List<Account> accounts {set;get;}
     public Account_Repeat(){
       accounts=[select name,phone,Industry,Rating from Account];
   }         
}