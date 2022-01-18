({
	clickedFruits : function(component, event, helper) {
		helper.clearAll(component,event);
        component.find("fruits").getElement().className ="slds-tabs_scoped__item slds-is-active tab";
        component.find("fruitsData").getElement().className="slds-tabs_scoped__content slds-show tabData";
	},
    clickedVegetables : function(component, event, helper) {
		helper.clearAll(component,event);
        component.find("vegetables").getElement().className ="slds-tabs_scoped__item slds-is-active tab";
        component.find("vegetablesData").getElement().className="slds-tabs_scoped__content slds-show tabData";
	},
    clickedFlowers : function(component, event, helper) {
		helper.clearAll(component,event);
        component.find("flowers").getElement().className ="slds-tabs_scoped__item slds-is-active tab";
        component.find("flowersData").getElement().className="slds-tabs_scoped__content slds-show tabData";
	},
})