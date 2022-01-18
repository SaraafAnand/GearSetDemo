global class AccountPlan{

       //Define an object in apex that is exposed in apex web service

  global class Plan {

  webservice String Name;

     webservice String aId; //Value Returned to Initial System

   }

   webservice static Plan createCasePlan(Plan vPlan) {

 

       //A plan maps to the Account object in salesforce.com.

      //So need to map the Plan class object to Account standard object

      Account a = new Account();

      a.Name = vPlan.Name;

      insert a;

      vPlan.aId = a.Id;

      return vPlan;

   }

}