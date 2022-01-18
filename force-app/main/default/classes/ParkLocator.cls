public class ParkLocator {
    public Static string[] country(String country){
        ParkService.ParksImplPort pk= new ParkService.ParksImplPort();
  //      List<String> country=new List<String>{'Japan','India'};
        List<String> res=pk.byCountry(country);
    System.debug('Result=====>>>'+res);
        return res;
    }

}