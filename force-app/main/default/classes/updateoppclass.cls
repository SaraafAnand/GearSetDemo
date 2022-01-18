public class updateoppclass {

Apexpages.StandardSetController controller;
    public updateoppclass(ApexPages.Standardsetcontroller controller){
this.controller=controller;
    }
    public PageReference gotostep2(){
        List<Opportunity>oppList= (List<Opportunity>)controller.getRecords();
system.debug('the list id'+oppList);
        List<Id>oppIDS=new List<Id>();
for(Opportunity op:oppList){
oppIDS.add(op.id); 
        }

        String url = '/apex/Step2page?';
for(Id oppID : oppIDS)
        {
url += 'ids=' + oppID + '&'; 
        }
url = url.left(url.length() - 1);
ApexPages.PageReference pr = new ApexPages.PageReference(url);
        //PageReferencepref=New PageReference('/apex/Step2page?id='+pageid);
pr.setRedirect(True);
        return pr;       
    }    
}