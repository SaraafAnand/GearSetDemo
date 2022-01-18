({
   openModel: function(component, event, helper) {
      component.set("v.isOpen", true);
   },
 
   closeModel: function(component, event, helper) { 
       if(component.get("v.isEdit")){
           component.set("v.isEdit", false);
       }else{
           component.set("v.isOpen", false);
       }      
   },
 
   Save: function(component, event, helper) {
      alert('Save click');
      component.set("v.isOpen", false);
   },
    
   handleEdit: function(component, event, helper) {
     component.set("v.isEdit", true);
   },
})