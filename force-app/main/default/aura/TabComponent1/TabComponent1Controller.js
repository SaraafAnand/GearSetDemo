({
    clickedTab1 : function(component, event, helper) {
        var	tab1=component.find("tab1");
        var tab1Data=component.find("tab1-data");
        var tab2=component.find("tab2");
        var tab2Data=component.find("tab2-data");
        var tab3=component.find("tab3");
        var tab3Data=component.find("tab3-data");
        $A.util.addClass(tab1,'slds-active');
        $A.util.addClass(tab1Data,'slds-show');
        $A.util.removeClass(tab1Data,'slds-hide');
        $A.util.removeClass(tab2,'slds-active');
        $A.util.removeClass(tab2Data,'slds-show');
        $A.util.addClass(tab2Data,'slds-hide');
        $A.util.removeClass(tab3,'slds-active');
        $A.util.removeClass(tab3Data,'slds-show');
        $A.util.addClass(tab3Data,'slds-hide');
    },
    clickedTab2 : function(component, event, helper) {
        var	tab1=component.find("tab1");
        var tab1Data=component.find("tab1-data");
        var tab2=component.find("tab2");
        var tab2Data=component.find("tab2-data");
        var tab3=component.find("tab3");
        var tab3Data=component.find("tab3-data");
        $A.util.addClass(tab2,'slds-active');
        $A.util.addClass(tab2Data,'slds-show');
        $A.util.removeClass(tab2Data,'slds-hide');
        $A.util.removeClass(tab1,'slds-active');
        $A.util.removeClass(tab1Data,'slds-show');
        $A.util.addClass(tab1Data,'slds-hide');
        $A.util.removeClass(tab3,'slds-active');
        $A.util.removeClass(tab3Data,'slds-show');
        $A.util.addClass(tab3Data,'slds-hide');
    },
    clickedTab3 : function(component, event, helper) {
        var	tab1=component.find("tab1");
        var tab1Data=component.find("tab1-data");
        var tab2=component.find("tab2");
        var tab2Data=component.find("tab2-data");
        var tab3=component.find("tab3");
        var tab3Data=component.find("tab3-data");
        $A.util.addClass(tab3,'slds-active');
        $A.util.addClass(tab3Data,'slds-show');
        $A.util.removeClass(tab3Data,'slds-hide');
        $A.util.removeClass(tab2,'slds-active');
        $A.util.removeClass(tab2Data,'slds-show');
        $A.util.addClass(tab2Data,'slds-hide');
        $A.util.removeClass(tab1,'slds-active');
        $A.util.removeClass(tab1Data,'slds-show');
        $A.util.addClass(tab1Data,'slds-hide');
    },
})