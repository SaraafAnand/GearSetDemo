public with sharing class displayvalues {
  public String field{get;set;}
   // public String oppnames{get;set;}

    public displayvalues(ApexPages.Standardsetcontroller controller){
    } 
    public PageReference gotopage1(){
PageReference pref2=New PageReference('/apex/oppupdatepage');
        pref2.setRedirect(True);
        return pref2;
    }

    public PageReference step3(){
        Id pageId= ApexPages.currentPage().getParameters().get('ids');
PageReference pref2=New PageReference('/apex/entervalues?'+'fieldName='+field);
        pref2.setRedirect(True);
        return pref2;
    }

    public List<selectOption>oppflds;

        public List<selectOption>getOppNames() {
oppflds = new List<selectOption>();
oppflds.add(new selectOption('--none--','--none--'));
Schema.DescribeSObjectResult opp_desc = Opportunity.sObjectType.getDescribe();
            Map<String, Schema.SObjectField> opp_fields = opp_desc.fields.getMap();
            for(String s:opp_fields.keyset() ){
             System.debug ('sssss'+s+'yyyy'+opp_fields.get(s));  
            }
for(Schema.sObjectField fld:opp_fields.values())
            {
                
                    String oppfldName = fld.getDescribe().getLabel();
oppflds.add(new selectOption(oppfldName,oppfldName));
            }
System.debug('stdObjectNames: ' + oppflds);
            return oppflds;
        }
}