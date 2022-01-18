({
 checkId : function(component, event, helper) {
        component.find('singleResult').set('v.value','It return length  - '+component.find('idUsedHereOnly').length +' means it is object(one component found with given id)'+  ' : Value is - '+component.find('idUsedHereOnly').get('v.value'));
        component.find('multipleResult').set('v.value','It return length  - '+component.find('idUsedAtMultiplePlace').length+' means it is array(multiple component found with given id)'+ ' : Values are - '+component.find('idUsedAtMultiplePlace')[0].get('v.value')+','+component.find('idUsedAtMultiplePlace')[0].get('v.value'));
    }
})