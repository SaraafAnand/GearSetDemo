trigger StudentEmailTrig on Student__c (before insert,after update,after Delete) {
    // Send email to the student if phone number is modified
    if(trigger.isAfter && trigger.isUpdate){
        Student_Email.afterUpdate_Email(trigger.oldMap,trigger.newMap);
    }
    // send email to the student if record is deleted
    if(trigger.isAfter && trigger.isDelete){
        Student_Email.deleteEmail(trigger.old);
    }
}