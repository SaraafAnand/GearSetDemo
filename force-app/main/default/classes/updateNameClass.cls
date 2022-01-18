public class updateNameClass{
    public String updateValue{get;set;}
    public Map<String,Schema.DisplayType> dtaMap {set;get;}
    public updateNameClass(ApexPages.Standardcontroller controller){
    } 
    public PageReference gotostep2(){
PageReference pref2=New PageReference('/apex/step2page');
        pref2.setRedirect(True);
        return pref2;
    }
       public List<Opportunity>optyList{set;get;}
public  Map<String, String>labelToAPIName {set;get;}
    public String fldValue {set;get;}
    public List<Opportunity>optyUpdate{set;get;}
    public updateNameClass(ApexPages.StandardSetcontroller controller){
        dtaMap=new Map<String,schema.displayType>();
this.optyList=(List<Opportunity>)Controller.getRecords() ;
labelToAPIName = new Map <String, String> ();

Map<String, Schema.SObjectField>fieldsMap = Schema.SObjectType.Opportunity.fields.getMap();
for (Schema.SObjectField field :fieldsMap.values())
{
  System.debug('label'+field.getDescribe().getLabel()+'*********Api**********'+field.getDescribe().getName());
labelToAPIName.put(field.getDescribe().getLabel(), field.getDescribe().getName());
    //dtaMap.put(field.getDescribe().getLabel(),fieldsMap.get(field).getDescribe().getType());
}
    }

    public pageReference updateMethod(){
optyUpdate=new List<opportunity>();

        String fld = System.currentPageReference().getParameters().get('fieldName');
System.debug('fld'+fldValue+'==='+fld);
      Schema.DisplayType  dtTypevalue= dtaMap.get(fld);
        if(labelToAPIName.containsKey(fld)){
             String apiFld=labelToAPIName.get(fld);
            System.debug('api'+apiFld);
for(opportunity op:optyList){
Map<String, Object>fieldValueMap = new Map<String, Object>();
fieldValueMap.put(apiFld,fldValue );
op.put(apiFld,fldValue);
optyUpdate.add(op);
        }


        }

        Update(optyUpdate);
System.debug('optyUpdate'+optyUpdate);
PageReference pref2=New PageReference('/apex/oppupdatepage');
        pref2.setRedirect(True);
        return pref2;
} 
}