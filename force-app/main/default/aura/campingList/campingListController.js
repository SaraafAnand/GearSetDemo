({
    handleAddItem : function (component,event,item){
 var addItem=event.getParam("addItem");
   var action=component.get("c.saveItem");
        action.setParams({"item":item});
        action.setCallback(this,function(response){
           var state=response.getState();
        if(State=='SUCCESS'){
            var theItems=component.get("v.items");
            theItems.push(item);
           component.set("v.items",theItems);
        }
                           });
        $A.enqueueAction(action);
    },
    doInit :function(component, event, helper) {
        var action=component.get("c.getItems");
        action.setCallback(this,function(response){
            var state=response.getstate();
            if(state=='SUCCESS'){
                component.set("v.items",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
	
    clickCreateItem : function(component, event, helper) {
      var allValid=component.find('campingForm').reduce(function(validSoFar,inputCmp){
inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        },true);
      if(allValid){
        var newExpense=component.get("v.newItem");
          console.log('expense Item is:'+JSON.stringify(newExpense));
     helper.createItem(component,newExpense);  
       
      }
    }
})