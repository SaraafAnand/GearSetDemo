({
	clickCreateItem : function(component, event, helper) {
      var allValid=component.find('campingForm').reduce(function(validSoFar,inputCmp){
inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        },true);
      if(allValid){
        var newExpense=component.get("v.newItem");
          console.log('expense Item is:'+JSON.stringify(newExpense));
       // helper.createItem(component,newExpense);  
       var	theCampingItems=component.get("v.Items");
        var newCampingItem=JSON.parse(JSON.stringify(newExpense));
        theCampingItems.push(newCampingItem);
        component.set("v.Items",theCampingItems);
        console.log('Succeded');
      }
        else{
           alert('please provide valid details');
        }
      }
})