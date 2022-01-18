({
	handleClick : function(component, event, helper) {
		var currStep = component.get("v.currStep");
        currStep = currStep < 4 ? (currStep+1) :currStep;
        if(currStep == 4) {
            component.set("v.isNextDisable",true);
        }
        component.set("v.currStep",currStep);
	}
})