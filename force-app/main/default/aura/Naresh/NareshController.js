({
	doInit : function(component, event, helper) {
		var action=component.get("c.getAcc");
        action.setParams({
            'accId': component.get("v.recordId")        
        });
        action.setCallback(this,function(response){
            if(response.getState()=='SUCCESS'){
               component.set('v.Account',response.getReturnValue()); 
			alert('success');
                helper.accHelper(component);
            }
        });
        $A.enqueueAction(action);

      
	}
  
   

})