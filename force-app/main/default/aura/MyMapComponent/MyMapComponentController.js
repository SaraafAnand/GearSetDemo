({
  doInit: function(component, event, helper) {
  //call apex class method
   var action = component.get('c.getMyMap');
   action.setCallback(this,function(response){
  //store state of response
    var state = response.getState();
      if (state === "SUCCESS") {
  //set response value(map) in myMap attribute on component.
    component.set('v.myMap',response.getReturnValue());
   }
});
   $A.enqueueAction(action);
},
 
})