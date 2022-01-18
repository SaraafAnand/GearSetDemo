({
	clickedSearch : function(component, event, helper) {
        var accList=component.set("v.accList",null);
         var mas=component.set("v.message",false);
        console.log('accList==>>'+accList);
		var searchfld=component.find("searchId");
        var searchValue=searchfld.get("v.value");
        console.log('searchValue======>>>>'+searchValue);
        if(searchValue==null||searchValue==''||searchValue==undefined){
            console.log('Null loop');
            searchfld.set("v.errors", [{message:"Enter a Text" }]);
        }
        else {
            console.log('else loop');
            searchfld.set("v.errors", null);
            helper.fetchAccounts(component,event,searchValue);
        }
	}
})