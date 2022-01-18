trigger conNameUpdate on account(after update,after insert) {



map<string,string> conMap=new map<string,string>();

set<string> conName=new set<string>();
for(contact c:[select accountid,name,MailingAddress  from contact limit 4]){

//conMap.put(c.accountid,c);
conName.add(c.name);
conMap.put(c.name,c.accountid);

}


system.debug('-----------conMap is'+conMap);
list<account> acclist=new list<account>();

for(account a:trigger.new){

account ac=new account();
ac.contact_countries__c=conName+','+conName;
acclist.add(ac);
}
insert acclist;



}