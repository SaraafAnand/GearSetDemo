({
	handleSaveMethod : function(component, event, helper) {
        component.find("recordEdit").saveRecord($A.getCallback(function(saveResult){
            if(saveResult.state==='SUCCESS' ||saveResult.state==='DRAFT'){
                console.log("Save completed successfully.");
            }
            else{
                console.log('Error is'+saveResult.state+',error:'+JSON.stringify(saveResult.error));
            }
        }));
	}
})