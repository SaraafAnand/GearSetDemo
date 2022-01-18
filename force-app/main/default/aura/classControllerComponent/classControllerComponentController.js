({
	doInit : function(component, event, helper) {
		var action=component.get("c.callme");
        action.setCallback(this,function(response){
            if(response.getState()==='SUCCESS'){
                component.set('v.objController',response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	}
})