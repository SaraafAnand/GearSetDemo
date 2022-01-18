({
	getPickListValues : function(component,fieldName,fieldId) {
		var action=component.get("c.getselectOptions");
        console.log('action'+action);
        action.setParams({
            "obj": component.get("v.sObjectName"),
            "field": fieldName
        });
               var options= [];
        action.setCallback(this,function(response){
            if(response.getState() == "SUCCESS"){
                console.log('Success');
                var pickValues=response.getReturnValue();
                if(pickValues !=undefined && pickValues.length>0){
                    options.push({
                        class: "optionClass",
                        label: "--- None ---",
                        value: ""
                    });
                    }
                    for (var i = 0; i < pickValues.length; i++) {
                    options.push({
                        class: "optionClass",
                        label: pickValues[i],
                        value: pickValues[i]
                    });
                }
                    console.log('options'+options);
                    component.find(fieldId).set("v.options",options);
                
            }
            else {
                console.log('failed');
            }
        });
        $A.enqueueAction(action);
	}
})