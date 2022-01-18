/*
    Class Name: ContractPDF
    Author: Ram
    Description: Sample Contract Render PDF Controller & sends document to Docusgin 
   
 */

public with sharing class ContractPDF {
  
	public Contract mycontract {get; set;}
	
	//Load Contract
	public ContractPDF(){
		try{
			mycontract = [Select c.SystemModstamp, c.StatusCode, c.Status, c.StartDate, c.SpecialTerms, 
							c.OwnerId, c.OwnerExpirationNotice, c.LastModifiedDate, c.LastModifiedById, c.LastApprovedDate,
							c.LastActivityDate, c.IsDeleted, c.Id, c.EndDate, c.Description, c.CustomerSignedTitle, c.CustomerSignedId,
							c.CustomerSignedDate, c.CreatedDate, c.CreatedById, c.ContractTerm, c.ContractNumber, c.CompanySignedId, c.CompanySignedDate,
							c.BillingStreet, c.BillingState, c.BillingPostalCode, c.BillingCountry, c.BillingCity, c.ActivatedDate, c.ActivatedById, 
							c.AccountId, c.Name From Contract c where c.id = : ApexPages.currentPage().getParameters().get('id') LIMIT 1];
			System.debug('Contract => '+mycontract);
		}catch(Exception ex){
			ApexPages.addMessages(+ex);
		}
	}
	
	
	//Send Contract to Docusgin
	public Pagereference sendDocsToDS(){
		Pagereference page = null;
		try{
			page = DocusignServices2.processDocument(mycontract.Id);
		}catch(Exception ex){
			ApexPages.addMessages(ex);
		}
		return page;
	}

}