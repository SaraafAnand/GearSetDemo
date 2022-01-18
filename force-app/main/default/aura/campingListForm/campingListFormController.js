({
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