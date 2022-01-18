({
	clearAll : function(component,event) {
	var getTabLi=document.getElementsByClassName ("tab");
    var getTabLiData=document.getElementsByClassName ("tabData");
        for(var i=0;i< getTabLi.length;i++){
           getTabLi[i].className="slds-tabs_scoped__item tab";
           getTabLiData[i].className="slds-tabs_scoped__content slds-hide tabData";    
        }
	}
})