({
     /**
    * Webkul Software.
    *
    * @category  Webkul
    * @author    Webkul
    * @copyright Copyright (c) 2010-2016 Webkul Software Private Limited (https://webkul.com)
    * @license   https://store.webkul.com/license.html
    */
    doInit :function(component, event, helper){
        var rec=component.get("v.recordId");
        var action=component.get("c.getAcc");
        action.setParams({
            "Id" : rec
        });
        action.setCallback(this,function(response){
            if(response.getState()=='SUCCESS'){
                helper.accDetails(component,response.getReturnValue());
                helper.viewAccount(component,event,response.getReturnValue());
            }  
        });
         $A.enqueueAction(action);
       //   var rep= component.find("accountRecordLoader").get('v.value');
//alert(rep);
    }
 })