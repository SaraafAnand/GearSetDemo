({
	doInit : function(component, event, helper) {
		component.find("recordCreate").getNewRecord(
        "contact",
        null,
        false,
        $A.getCallback(function(){
             var rec=component.get("v.record");
             var err=component.get("v.recordError");
            if(err ||(rec===null)){
                console.log('Error found while creating record'+err);
            }
            else{
				console.log('record creation process initialised'+rec.sobjectType);
            }
            })
        );
	},
    handleSaveMethod : function(component, event, helper){
        var allValid = component.find('conField').reduce(function (validFields,
    inputCmp) {
    inputCmp.showHelpMessageIfInvalid();
    return validFields && inputCmp.get('v.validity').valid;
    }, true);
        if(allValid){
            component.set("v.recordfields.AccountId","v.recordId");
            component.find("recordCreate").saveRecord(function(saveResult){
                if(saveResult.state ==="SUCCESS" ||saveResult.state ==="DRAFT"){
                    var resultsToast=$A.get("e.force:showToast");
                    resultsToast.setParams({
                        "title" : "saved",
                        "message" : "Record was Saved"
                    });
                    resultsToast.fire();
                }
                else{
                    console.log('There was a error:'+JSON.stringify(saveResult.error));
                }
            });
        }
    }
})