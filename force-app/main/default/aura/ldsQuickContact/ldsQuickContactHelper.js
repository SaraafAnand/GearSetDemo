({
    validateContactForm: function(component) {
        var validContact = true;

         // Show error messages if required fields are blank
        var allValid = component.find('contactField').reduce(function (validFields, inputCmp) {
            inputCmp.showHelpMessageIfInvalid();
            return validFields && inputCmp.get('v.validity').valid;
        }, true);

        if (allValid) {
            // Verify we have an account to attach it to
            validContact = true;
        	return(validContact);
            
        }  
	}
       
})