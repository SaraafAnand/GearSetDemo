({
    handleSubmit: function(component, event, helper) {
     component.find('form').submit();
    },
    handleSuccess: function(cmp, event, helper) {
     component.find('overlayLib').showCustomPopover({
            body: "Popovers are positioned relative to a reference element",
            referenceSelector: ".mypopover",
            cssClass: "slds-nubbin_left,slds-popover_walkthrough,no-pointer"
        }).then(function (overlay) {
            setTimeout(function(){ 
                //close the popover after 3 seconds
                overlay.close(); 
            }, 3000);
        });    
            component.find("popuplib").notifyClose();
 }
    
})