({
	helperMethod : function(component, event, helper) {
	var action = component.get("c.getPickListValues");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS"){
                var result = response.getReturnValue();
              component.set("v.TypePicklist", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);	
	},
    helperMethod1 : function(component, event, helper) {
		var action = component.get("c.getPickListValues1");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS"){
                var result = response.getReturnValue();
               component.set("v.TypePicklist1", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);	
	}
})