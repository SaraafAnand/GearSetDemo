trigger acNameUpdate on Contact (after update,after insert) {

set<id> ids=new set<id>();
list<contact> conlist=new list<contact>();

for(contact c:[select accountid, id,name from contact limit 5]){

system.debug('---------c name'+c.name);
contact con=new contact();
ids.add(c.accountid);
con.id=c.id;


  for(account a:[select contact_names__c ,name ,id from account where id in:ids]){
  
  a.contact_names__c =c.name+','+c.name;

    }    


}update conlist;

system.debug('--------------conlist is'+conlist);
system.debug('--------------ids'+ids);


  
}