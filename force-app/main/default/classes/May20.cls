public class May20 {

    public static Map<String,Integer> asciiMap = new Map<String,Integer>{
			'a' => 97,'b'=>98,'c'=>99,'d'=>100,'e'=>101,'f'=>102,'g'=>103,'h'=>104,'i'=>105,'j'=>106,'k'=>107,'l'=>108,'m'=>109,'n'=>110,'o'=>111,'p'=>112,'q'=>113,'r'=>114,'s'=>115,'t'=>116,'u'=>117,'v'=>118,'w'=>119,'x'=>120,'y'=>121,'z'=>122		
    };
        
        public static void asciMap(){
           
             Blob b = Crypto.GenerateAESKey(128);
        String h = EncodingUtil.ConvertTohex(b);
            
            String str = '';
            for(String s:h.split('')){
					                
                if(!s.isNumeric() && asciiMap.containsKey(s)){
							str +=  asciiMap.get(s);                   
                }else{
                    str +=  s; 
                }
            }
            System.debug('h===>>'+h);
            System.debug('str===>>'+str.substring(0,15));
            
        }     

}