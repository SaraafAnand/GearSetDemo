public class OptyDup {

public  List<Opportunity> optyList;
    public void check(String op){

Integer x= op.length();
        System.debug('x'+x+op.substring(x-2,x-1));
        if(op.substring(x-2,x-1)=='v'&&(op.substring(x-1)!=null||op.substring(x-1)!='')){
            String na=op.substring(0,x-2);
                String optyName='select id,name from opportunity where name like \''+na+'%\'';
        optyList=Database.query(optyName);
            System.debug('optyList'+optyList);
            }
        else{
              String optyName='select id,name from opportunity where name like \''+op+'%\'';
        optyList=Database.query(optyName);
            System.debug('optyList1'+optyList);
        }
        if(optyList.size()>0 && optyList.size()!=1 && op.substring(x-2,x-1)=='v'&&(op.substring(x-1)!=null||op.substring(x-1)!='')){
            op=op.substring(0,x-2)+'v'+optyList.size();
             System.debug('opty'+op);
            Opportunity opty=new Opportunity(closeDate=System.today(),stageName='closed won');
        opty.name=op;
            insert opty;
        
        }
        else if(optyList.size()>0 && optyList.size()!=1 && op.substring(x-2)!='v'){
              op=op+'v'+optyList.size();
             System.debug('opty'+op);
            Opportunity opty=new Opportunity(closeDate=System.today(),stageName='closed won');
        opty.name=op;
            insert opty;
        }
        else if( optyList.size()==1){
            op=op+'v'+1;
               System.debug('opty1'+op);
            Opportunity opty=new Opportunity(closeDate=System.today(),stageName='closed won');
        opty.name=op; 
            insert opty;
        }
        else{
            
             Opportunity opty=new Opportunity(name=op,closeDate=System.today(),stageName='closed won');
            insert opty;
        }
    }


}