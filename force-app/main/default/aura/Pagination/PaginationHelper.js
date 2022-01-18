({
    /*
     * Initially this Method will be called and will fetch the records from the Salesforce Org 
     * Then we will hold all the records into the attribute of Lightning Component
     */
    doFetchContact : function(component) {
     var pageSize = component.get("v.pageSize");
        // hold all the records into an attribute named "ContactData"
        
        // get size of all the records and then hold into an attribute "totalRecords"
        component.set("v.totalRecords", component.get("v.ContactData").length);
        // set star as 0
        
        component.set("v.startPage",0);
        
        component.set("v.endPage",pageSize-1);
        var PaginationList = [];
        for(var i=0; i< pageSize; i++){
            if(component.get("v.ContactData").length> i)
                PaginationList.push(component.get('v.ContactData')[i]);    
        }
        var total=Math.ceil((component.get("v.ContactData").length)/10);
        console.log("No of Records"+component.get("v.ContactData").length+"total"+total);
        if(total <=1){
            component.set('v.total',1);  
        }
        else {
            component.set('v.total',total);   
        }
        component.set('v.pagenumber',1);
        component.set('v.PaginationList', PaginationList);
        component.set('v.isSending',false);
        
        
    },
    /*
     * Method will be called when use clicks on next button and performs the 
     * calculation to show the next set of records
     */
    next : function(component, event){
        var sObjectList = component.get("v.ContactData");
        var end = component.get("v.endPage");
        var start = component.get("v.startPage");
        var pageSize = component.get("v.pageSize");
        var tot= component.get('v.total'); 
        var Paginationlist = [];
        var counter = 0;
        for(var i=end+1; i<end+pageSize+1; i++){
            if(sObjectList.length > i){
                Paginationlist.push(sObjectList[i]);
            }
            counter ++ ;
        }
        start = start + counter;
        end = end + counter;
        var pgno=component.get('v.pagenumber');
        
        pgno=pgno+1;
        component.set('v.pagenumber',pgno); 
        component.set("v.startPage",start);
        component.set("v.endPage",end);
        component.set('v.PaginationList', Paginationlist);
    },
    /*
     * Method will be called when use clicks on previous button and performs the 
     * calculation to show the previous set of records
     */
    previous : function(component, event){
        var sObjectList = component.get("v.ContactData");
        var end = component.get("v.endPage");
        var start = component.get("v.startPage");
        var pageSize = component.get("v.pageSize");
        var Paginationlist = [];
        var counter = 0;
        for(var i= start-pageSize; i < start ; i++){
            if(i > -1){
                Paginationlist.push(sObjectList[i]);
                counter ++;
            }else{
                start++;
            }
        }
        start = start - counter;
        end = end - counter;
        var pgno=component.get('v.pagenumber');
        pgno=pgno-1;
        
        component.set('v.pagenumber',pgno);
        component.set("v.startPage",start);
        component.set("v.endPage",end);
        component.set('v.PaginationList', Paginationlist);
    },
    first :function(component,event){
        var sObjectList = component.get("v.ContactData"); 
        var paginationList=[];
        var pageSize = 10;
        for(var i=0;i<pageSize-1;i++){
            if(sObjectList.length > i){
                paginationList.push(sObjectList[i]);
            }
        }
        component.set('v.PaginationList', paginationList);
        component.set("v.startPage",0);
        component.set("v.endPage",pageSize-1);
        component.set('v.pagenumber',1);
    },
    last :function(component,event){
        var sObjectList = component.get("v.ContactData"); 
        var paginationList=[];
        
        var pageSize = sObjectList.length-10;
        for(var i=pageSize-1;i<sObjectList.length;i++){
            if(sObjectList.length > i){
                paginationList.push(sObjectList[i]);
            }
        }
        var total= component.get('v.total');
        component.set('v.PaginationList', paginationList);
        component.set("v.startPage",pageSize-1);
        component.set("v.endPage",sObjectList.length-1);
        component.set('v.pagenumber',total);
        
    },
})