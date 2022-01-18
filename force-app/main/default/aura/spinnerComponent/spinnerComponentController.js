({
	clickedbutton : function(component, event, helper) {
		var action=component.get("c.getContacts");
        action.setCallback(this,function(response){
            if(response.getState()=='SUCCESS'){
                console.log('Success');
                component.set("v.contactsList", response.getReturnValue());
                console.log('conList'+v.contactsList);
            } 
        });
        $A.enqueueAction(action);
	}
})