({
	doInit : function(component, event, helper) {
		helper.getPickListValues(component,'Industry','select');
	},
    selectedValue: function(component, event, helper){
 var opt=component.get("v.select");
        alert (event.getSource().get("v.value"));
    }
})