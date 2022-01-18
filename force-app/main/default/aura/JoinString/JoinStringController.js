({

    clickCreate: function(component, event, helper) {
 	/*var childComp=component.find("email").get("v.value");
 console.log(childComp);
      for(var cmp in component.find("itemname")){
        console.log(component.find("itemname")[cmp]);
     var   output = component.find("itemname")[cmp].get("v.value");
        console.log(output);
    } */
        var input = document.getElementById('name').value;
        var input1 = document.getElementById('email').value;
        if((input !='' || input1 !='')){
            component.set( "v.bool",'True');
            component.set("v.pop",input+input1);
        }
    }

})