({
	doInit : function(component, event, helper) {
		var action = component.get('c.getAccounts');
        action.setCallback(this,function(response){
            if(response.getState() === 'SUCCESS'){
             component.set('v.accounts',response.getReturnValue());   
            } 
        });
        $A.enqueueAction(action);
    },
    editAccount : function(component, event, helper) {
       $A.createComponent("c:AccountEdit", { recordId : event.getSource().get('v.value') },
                           function(content, status) {
                               if (status === "SUCCESS") {
                                   component.find('overlayLib').showCustomModal({
                                       header: "Account  Edit",
                                       body: content, 
                                       showCloseButton: true,
                                       cssClass: "mymodal"
                                       
                                   })
                               }                               
                           });
    }
})