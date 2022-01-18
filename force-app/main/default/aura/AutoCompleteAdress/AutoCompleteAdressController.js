({
	getCities : function(component, event, helper){	
	 
	var params = {
	  "input" : component.get('v.location')	
	} 
 
	helper.callServer(component,"c.getSuggestions",function(response){
        alert(response);
		var resp = JSON.parse(response);	
		//console.log(resp.predictions);
		component.set('v.predictions',resp.predictions);	
	},params);	
 
},
    getCityDetails : function(component, event, helper){		 
 
	var selectedItem = event.currentTarget;
        var placeid = selectedItem.dataset.placeid;
 
	var params = {
	   "placeId" : placeid  	
	} 
 
	helper.callServer(component,"c.getPlaceDetails",function(response){
		var placeDetails = JSON.parse(response); 		 
		component.set('v.location',placeDetails.result.name);	
		component.set('v.predictions',[]); 
	},params);	
 
}
})