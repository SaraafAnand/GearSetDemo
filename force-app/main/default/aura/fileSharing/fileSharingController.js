({
    //get Contact List from apex controller
    doInit : function(component, event, helper) {
        debugger;
        var action = component.get("c.getFiles");
        
        action.setCallback(this, function(result){
            var state = result.getState();
            if (component.isValid() && state === "SUCCESS"){
                component.set("v.contactList",result.getReturnValue());   
            }
        });
        $A.enqueueAction(action);
    }
     
   
})