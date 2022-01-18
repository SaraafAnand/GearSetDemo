public class ShakleeJSON{

    public static JsonParser parse(String json){
		JsonParser js = (JsonParser) System.JSON.deserialize(json, JsonParser.class);
	System.debug('js==>>'+js);
        return js;
  }
}