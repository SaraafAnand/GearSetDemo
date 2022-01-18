({
	doInit: function(component, event, helper) {
        var ownerId = component.get("v.accRecord").OwnerId;
        var leadFlag = component.get("v.accRecord").Name;
        alert('@@@ OwnerId'+ownerId);
        console.log('@@@ Name ' + leadFlag);
}
})