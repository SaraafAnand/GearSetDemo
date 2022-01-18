/* Author:S.Anand
* Version:40.0
* Requirement:whenever a faculty is created create a approval process
* CreatedDate:28/10/2017
*/
trigger FacultyApprovalTrigger on Faculty__c (after insert,after update) { 
   
    user user1=[select id from user where username='wilsonov@gmail.com'];
  for (Faculty__c faculty1:trigger.new) {
       // create the new approval request to submit
         Approval.ProcessSubmitRequest  req = new Approval.ProcessSubmitRequest();
            req.setComments('Submitted for approval. Please approve.');
            System.debug('facultyId===>>'+faculty1.id);
     // Created an approval request for the account
        Approval.ProcessSubmitRequest req1 =  new Approval.ProcessSubmitRequest();
        req1.setComments('Submitting request for approval.');
        req1.setObjectId(faculty1.id);
      system.debug('objectId'+faculty1.id);
    // Submited on behalf of a specific submitter
        req1.setSubmitterId(user1.Id);
    // Submit the record to specific process and skip the criteria evaluation
        req1.setProcessDefinitionNameOrId('FacultyApproval');
        req1.setSkipEntryCriteria(true);
        // Submit the approval request for the account
        Approval.ProcessResult result = Approval.process(req1);
        System.debug('result====>>'+result);
  
     }
   
}