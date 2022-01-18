({
	doInit : function(component, event, helper) {
        alert('RecordId:::::'+component.get("v.recordId"));
        var action = component.get(c.getRecordDetails);
        action.setParams({ recordId :component.get("v.recordId")  });
		 action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                // Alert the user with the value returned 
                // from the server
                alert("From server: " + response.getReturnValue());
                var urlEvent = $A.get("e.force:navigateToURL");
   			 urlEvent.setParams({
      			"url": response.getReturnValue()
    			});
   			 urlEvent.fire();
                
                // You would typically fire a event here to trigger 
                // client-side notification that the server-side 
                // action is complete
            }
            else  {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + 
                                 errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            }
        });

        $A.enqueueAction(action);
    
	}
})