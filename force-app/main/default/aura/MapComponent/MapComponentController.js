({
	doInit : function(component, event, helper) {
		var action=component.get("c.getMap");
        action.setCallback(this,function(response){
            var state=response.getState();
            console.log('Success'+state);
            if(state === "SUCCESS"){
                component.set('v.myMap',response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	},
})