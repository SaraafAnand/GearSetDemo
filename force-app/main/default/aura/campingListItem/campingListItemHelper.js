({
	createItem : function(component,campingItem) {
	var	theCampingItems=component.get("v.Items");
        var newCampingItem=JSON.parse(JSON.stringify(campingItem));
        theCampingItems.push(newCampingItem);
        component.set("v.Items",theCampingItems);
        console.log('Succeded');
	}
})