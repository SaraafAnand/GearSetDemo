({
	doInit : function(component, event, helper) {
  var action = component.get("c.getAccounts");   
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {                
                var custs = [];
                var conts = response.getReturnValue();
                for ( var key in conts ) {
                    custs.push({value:conts[key], key:key});
                }
                component.set("v.customers", custs);
                component.set("v.showBool", true);
            } 
  });           
        $A.enqueueAction(action); 
	},
    handleSearch : function(component,event,helper) {
     var accfields=component.get("v.acc");
        var wrap={};
        wrap.RecordType=accfields.RecordType;
        wrap.ParentAccountNo=accfields.ParentAccountNo__c;
        wrap.AccountNo=accfields.AccountNo__c;
            wrap.BillingCountry=accfields.BillingCountry;
            wrap.StartDate=accfields.StartDate__c;
            wrap.EndDate=accfields.EndDate__c;
            
        var jsonString= JSON.stringify(wrap);
        var action=component.get('c.searchAcc');
        action.setParams({
            "param" : jsonString
        });
        action.setCallback(this,function(response){
            if(response.getState()=="SUCCESS"){
                component.set('v.accounts', response.getReturnValue());
            } 
        });
        $A.enqueueAction(action);
    }
})