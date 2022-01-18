public class TaskCheck {
    public List<TaskCheckWrapper> tcw{set;get;}
    public integer rowNo{set;get;}
    public TaskCheck(){
        tcw=new List<TaskCheckWrapper>();
        system.debug(tcw.size());
        TaskCheckWrapper Tw= new TaskCheckWrapper();
        tcw.add(Tw);
        system.debug(Tw);
        add();
    }
    public Void add(){
     TaskCheckWrapper Tw= new TaskCheckWrapper();
        tcw.add(Tw);
}
    public Void getDetails(){
        TaskCheckWrapper Tw=tcw.get(rowNo);
        system.debug(Tw.prodName);
    }
}