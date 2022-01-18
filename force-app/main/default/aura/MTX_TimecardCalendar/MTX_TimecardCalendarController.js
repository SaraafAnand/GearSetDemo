({
    doInit : function(component, event, helper) {
        var today = new Date();
        component.set('v.today', today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate());
    },

    setOutput : function(component, event, helper) {
    	var cmpMsg = component.find("msg");
    	$A.util.removeClass(cmpMsg, 'hide');
        var expdate = component.find("expdate").get("v.value");

        var oDate = component.find("oDate");
        oDate.set("v.value", expdate);

    },
    sendDate : function(component, event, helper){
        var updateDateEvent = $A.get("e.c:MTX_CalendarToSheet_Event");
        updateDateEvent.setParams({
            'datefromcalendar' : component.get('v.today')
        });
        updateDateEvent.fire();
    }
})