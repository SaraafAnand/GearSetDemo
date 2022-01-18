({
	fetchAccounts : function(component,event,searchKey) {
console.log('searchKey is===>>'+searchKey);
		var action=component.get("c.getAccounts");
        action.setParams({
            'keyword': searchKey 
        });
        
        action.setCallback(this,function(response){
            if(response.getState()==='SUCCESS'){
                console.log('success');
              var result=response.getReturnValue();
                if(result.length == 0){
                     console.log('No Accounts');
                    component.set("v.message",true);
                   
                }
                else{
                    console.log('Result is=====>>>>'+result);
                    console.log('Total Accounts'+result.length);
                   component.set("v.noOfRecords",result.length);
                   component.set("v.accList",result); 
                }
            }
        });
        $A.enqueueAction(action);
	}
})