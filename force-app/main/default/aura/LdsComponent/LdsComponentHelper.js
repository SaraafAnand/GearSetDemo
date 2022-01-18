({
	accDetails : function(component,obj) {
		var action=component.get("c.getObj");
       
        action.setParams({
            'x': obj.Name,
            'y': obj.Rating
        });
        action.setCallback(this,function(response){
            if(response.getState()=='SUCCESS'){
                alert('Success');
          
            } 
        });
        $A.enqueueAction(action);
    },
    viewAccount : function(component, event, obj) {
        var viewRecordEvent = $A.get("e.force:navigateToURL");
        viewRecordEvent.setParams({
             "url": "/" + obj.Id
       });
       viewRecordEvent.fire();
    }
})