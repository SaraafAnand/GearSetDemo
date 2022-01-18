({
	doInit : function(component, event, helper) {
        var cmp1=component.get("v.recordId");
        alert(cmp1);
		var cmp=component.get("v.simpleRecord");
        alert(cmp);
        var cmp2=component.get("v.record");
           alert(cmp2);
	}
})