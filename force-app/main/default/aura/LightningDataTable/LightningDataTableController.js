({
 doInit : function(component, event){
        var contactAction = component.get("c.fetchAccountContacts"); 
        contactAction.setParams({
            contactId: component.get("v.recordId")
        });
        contactAction.setCallback(this,function(response){
            var state = response.getState();
            if (state === "SUCCESS" && response.getReturnValue() != '') {
                var records =response.getReturnValue();
                records.forEach(function(record){
                    record.LinkName = '/'+record.Id;
                });
                component.set('v.data',response.getReturnValue());
            }else if(state === "ERROR"){
                console.log('A problem occurred: ' + JSON.stringify(response.error));
            }
        });
        $A.enqueueAction(contactAction); 
    }
})