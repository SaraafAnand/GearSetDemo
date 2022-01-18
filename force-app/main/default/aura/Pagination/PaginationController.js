({
    doInit: function (component, event, helper) {
        // Set the columns of the Table 
        component.set('v.isSending',true);
        var contacts=component.get("v.ContactData").length;
        if(contacts <= 10){
            component.set('v.pageSize',contacts);
        }
            helper.doFetchContact(component);
            },
          
            next: function (component, event, helper) {
            helper.next(component, event);
            },
            previous: function (component, event, helper) {
            helper.previous(component, event);
            },
            first : function (component, event, helper) {
            helper.first(component,event);
            },
            last : function (component, event, helper) {
            helper.last(component,event);
            }
            })