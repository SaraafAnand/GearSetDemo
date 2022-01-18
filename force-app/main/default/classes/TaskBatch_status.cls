// Fetch all tasks assigned to user and set the status as closed
global class TaskBatch_status implements Database.Batchable <sObject> {
    // Query the username whose status of task need to be changed
    global Database.QueryLocator start(Database.BatchableContext bc){
          User u=[select id from user where username='anandov@gmail.com'];
        return Database.getQueryLocator('select status from Task');
    }
    //for each task fetched from the above list change the status as closed 
    global void execute(Database.BatchableContext bc,List<Task>scope){
        List<Task> taskList=new List<Task>();
        for(Task newTask:scope){
            newTask.status='closed';
            System.debug('updatedTask Details====>>>'+newTask);
            taskList.add(newTask);
        }
        update taskList;
    }
    
    global void finish(Database.BatchableContext bc){
        
    }
}