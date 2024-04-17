class ApiPaths {
  ApiPaths._();
  static String openWeatherBaseUrl =
      "https://api.openweathermap.org/data/2.5/forecast?q=";
  static String openWeatherKey =
      "&units=metric&appid=e060c5ccf5bcb22f0a8207c885d7488d";
  static String queryLocation = "multan";

  static String weatherStackUrl =
      "http://api.weatherstack.com/current?access_key=582ceee3cf1635ff1969fd566f3f5b4c&query=";

  static String visualCrossingBaseUrl =
      "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/";
  static String visualCrossingKey =
      "%2C%20PB%2C%20PK?unitGroup=uk&key=QD8UXAEXG9GZWE2SEMT4H5D6V&include=obs%2Cfcst%2Chours%2Ccurrent%2Chistfcst";

  static String bitWeatherBaseUrl =
      "https://api.weatherbit.io/v2.0/forecast/daily?city=";
  static String auth = "&key=ffef5dd0cafd4b26b0295cfbacb694ad";

  static String simpleWeatherBaseUrl =
      "http://api.weatherapi.com/v1/forecast.json?key=462ec5dc18d84eafb2b114257212511&q=";
  static String forecastSimpleWeather = "&days=10&aqi=no&alerts=no";
  static String stormGlassBaseUrl =
      "https://api.stormglass.io/v2/weather/point?";
  static String queryLatLng = "lat=30.1575&lng=71.5249";
  static String stormGlassAuth =
      "&params=airTemperature,visibility,humidity,windSpeed,pressure,precipitation&key=d2c3b64e-4c52-11ec-b7e4-0242ac130002-d2c3b6bc-4c52-11ec-b7e4-0242ac130002";
}

// https://api.openweathermap.org/data/2.5/forecast?q=lahore&units=metric&appid=e060c5ccf5bcb22f0a8207c885d7488d
// http://api.weatherstack.com/current?access_key=582ceee3cf1635ff1969fd566f3f5b4c&query=multan
//  http://api.weatherstack.com/current?access_key=f787179913af4bb365576178fbb8abfb&query=multan;
//https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/Lahore%2C%20PB%2C%20PK?unitGroup=uk&key=QD8UXAEXG9GZWE2SEMT4H5D6V&include=fcst%2Cstats%2Chours%2Ccurrent

// https://api.weatherbit.io/v2.0/forecast/daily?city=lahore&key=ebfe7e10f67f4021b24ab971e7bd3e10
// https://api.stormglass.io/v2/weather/point?lat=31.5204&lng=74.3587&params=airTemperature,visibility,humidity,windSpeed,pressure,precipitation&key=d2c3b64e-4c52-11ec-b7e4-0242ac130002-d2c3b6bc-4c52-11ec-b7e4-0242ac130002
//http://api.weatherapi.com/v1/forecast.json?key=462ec5dc18d84eafb2b114257212511&q=lahore&days=10&aqi=no&alerts=no

// https://api.weatherbit.io/v2.0/current?city=lahore&key=ebfe7e10f67f4021b24ab971e7bd3e10
//ffef5dd0cafd4b26b0295cfbacb694ad
//http://api.weatherapi.com/v1/forecast.json?key=462ec5dc18d84eafb2b114257212511&q=lahore&days=10&aqi=no&alerts=no
