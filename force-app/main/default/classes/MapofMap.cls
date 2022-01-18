public class MapofMap {
    
    public void check(){
     List<City> cities = new List<City>();
	
	cities.add(new City('Mesa','Arizona','US'));
	cities.add(new City('Phoenix','Arizona','US'));
	cities.add(new City('Miami','Florida','US'));
	cities.add(new City('Patna','Bihar','IN'));
	cities.add(new City('Samastipur','Bihar','IN'));
	cities.add(new City('Brisbane','Queensland','AU'));
	cities.add(new City('Caboolture','Queensland','AU'));
	cities.add(new City('Airdrie','Alberta','CA'));
	cities.add(new City('Camrose','Alberta','CA'));
	System.debug('cities'+cities);	
	Map<String,Map<String,List<String>>> mapOfMaps = new Map<String,Map<String,List<String>>>();
	
	
	
	
	
	for(City  cityObj : Cities){
	/*
		Logic could be implemented better 
	*/
        System.debug('cityObj &&&&'+cityObj);
		if(mapOfMaps.containsKey(cityObj.country)){
			mapOfMaps.get(cityObj.country).get(cityObj.state).add(cityObj.cityName);
		}
		else{
			List<String> cities1 = new List<String>();
			cities1.add(cityObj.cityName);
			Map<String,List<String>> stateToCities = new Map<String,List<String>>();
			stateToCities.put(cityObj.state,cities1);
			mapOfMaps.put(cityObj.country,stateToCities);
		}
	}   
       System.debug('mapOfMaps'+mapOfMaps); 
     }
	public Class City{
	
		String cityName{ get; set; }
		String state{ get; set; }
		String country{ get; set; }
		
		public city(String cityName, String state, String country){
			this.cityName = cityName;
			this.state = state;
			this.country = country;
		}
    }
}