public with sharing class Pdfimage{   
public List<Payment__C> Paylist {get; set;}
      public String imageUrl{get;set;} //CH07
  
       public Pdfimage(){
        Paylist = [SELECT Id, Name  FROM Payment__C
                        WHERE Id =: Apexpages.currentPage().getParameters().get('Id')];
       String s=Label.Site.lastname_is_required;           
      imageUrl='https://www.barcodesinc.com/generator/image.php?code=Anand'+'&style=325&type=C128B&width=200&height=50&xres=1&font=3';
     
      }
        
}