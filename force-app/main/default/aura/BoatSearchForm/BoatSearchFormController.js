({
    doInit : function (component, event, helper){
        alert('boats');
        var action=component.get("c.boatTypes");
        action.setCallback(this, function(response){
            if(response.getState()=='SUCCESS'){
                alert('boats Success');
                component.set("v.boatTypes",response.getReturnValue());
            } 
        });
        $A.enqueueAction(action);
    },
    
	createRecord : function (component, event, helper) {
       // alert('inside create');
    var createRecordEvent = $A.get("e.force:createRecord");
    
        createRecordEvent.setParams({
        "entityApiName": "Boat__c"
    });
    createRecordEvent.fire();
}
})