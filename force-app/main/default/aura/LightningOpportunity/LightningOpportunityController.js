({
	myAction : function(component, event, helper) {
		
	},
      onchange : function(component, event, helper) {
      //  debugger;
        var label = component.find("sel").get("v.value");
        component.set("v.val",label);
      // alert('label==>>'+label);
    }
})