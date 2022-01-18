({
    
	helperMethod : function(component,item) {
		var action=component.get("c.saveItem");
        action.setCallback(this,function(response){
            action.setParams({"campItem":item});
            var state=response.getState();
            if(component.isValid() && state==="Success"){
              var items=component.get("v.items");
                items.push(response.getReturnValue());
                component.set("v.items",items);
            }
        });
        $A.enqueueAction(action); 
	},
  
    
     createItem : function(component) {
        var newItem = component.get("v.newItem");
        var addEvent = component.getEvent("addItem");
        addEvent.setParams({"item" : newItem});
        addEvent.fire();
        component.set("v.newItem",
                     { 'sobjectType': 'Camping_Item__c',
                    'Name': '',
                    'Packed__c': false,
                    'Price__c': 0,
                    'Quantity__c': 0});
    }

})