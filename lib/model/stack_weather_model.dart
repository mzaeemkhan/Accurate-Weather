class StackWeatherModel {
  StackWeatherModel({
      this.request, 
      this.location, 
      this.current,});

  StackWeatherModel.fromJson(dynamic json) {
    request = json['request'] != null ? Request.fromJson(json['request']) : null;
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    current = json['current'] != null ? Current.fromJson(json['current']) : null;
  }
  Request? request;
  Location? location;
  Current? current;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (request != null) {
      map['request'] = request?.toJson();
    }
    if (location != null) {
      map['location'] = location?.toJson();
    }
    if (current != null) {
      map['current'] = current?.toJson();
    }
    return map;
  }

}

class Current {
  Current({
      this.observationTime, 
      this.temperature, 
      this.weatherCode, 
      this.weatherIcons, 
      this.weatherDescriptions, 
      this.windSpeed, 
      this.windDegree, 
      this.windDir, 
      this.pressure, 
      this.precip, 
      this.humidity, 
      this.cloudcover, 
      this.feelslike, 
      this.uvIndex, 
      this.visibility, 
      this.isDay,});

  Current.fromJson(dynamic json) {
    observationTime = json['observation_time'];
    temperature = json['temperature'];
    weatherCode = json['weather_code'];
    weatherIcons = json['weather_icons'] != null ? json['weather_icons'].cast<String>() : [];
    weatherDescriptions = json['weather_descriptions'] != null ? json['weather_descriptions'].cast<String>() : [];
    windSpeed = json['wind_speed'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressure = json['pressure'];
    precip = json['precip'];
    humidity = json['humidity'];
    cloudcover = json['cloudcover'];
    feelslike = json['feelslike'];
    uvIndex = json['uv_index'];
    visibility = json['visibility'];
    isDay = json['is_day'];
  }
  String? observationTime;
  dynamic? temperature;
  dynamic? weatherCode;
  List<String>? weatherIcons;
  List<String>? weatherDescriptions;
  dynamic? windSpeed;
  dynamic? windDegree;
  String? windDir;
  dynamic? pressure;
  dynamic? precip;
  dynamic? humidity;
  dynamic? cloudcover;
  dynamic? feelslike;
  dynamic? uvIndex;
  dynamic? visibility;
  String? isDay;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['observation_time'] = observationTime;
    map['temperature'] = temperature;
    map['weather_code'] = weatherCode;
    map['weather_icons'] = weatherIcons;
    map['weather_descriptions'] = weatherDescriptions;
    map['wind_speed'] = windSpeed;
    map['wind_degree'] = windDegree;
    map['wind_dir'] = windDir;
    map['pressure'] = pressure;
    map['precip'] = precip;
    map['humidity'] = humidity;
    map['cloudcover'] = cloudcover;
    map['feelslike'] = feelslike;
    map['uv_index'] = uvIndex;
    map['visibility'] = visibility;
    map['is_day'] = isDay;
    return map;
  }

}

class Location {
  Location({
      this.name, 
      this.country, 
      this.region, 
      this.lat, 
      this.lon, 
      this.timezoneId, 
      this.localtime, 
      this.localtimeEpoch, 
      this.utcOffset,});

  Location.fromJson(dynamic json) {
    name = json['name'];
    country = json['country'];
    region = json['region'];
    lat = json['lat'];
    lon = json['lon'];
    timezoneId = json['timezone_id'];
    localtime = json['localtime'];
    localtimeEpoch = json['localtime_epoch'];
    utcOffset = json['utc_offset'];
  }
  String? name;
  String? country;
  String? region;
  String? lat;
  String? lon;
  String? timezoneId;
  String? localtime;
  dynamic? localtimeEpoch;
  String? utcOffset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['country'] = country;
    map['region'] = region;
    map['lat'] = lat;
    map['lon'] = lon;
    map['timezone_id'] = timezoneId;
    map['localtime'] = localtime;
    map['localtime_epoch'] = localtimeEpoch;
    map['utc_offset'] = utcOffset;
    return map;
  }

}

class Request {
  Request({
      this.type, 
      this.query, 
      this.language, 
      this.unit,});

  Request.fromJson(dynamic json) {
    type = json['type'];
    query = json['query'];
    language = json['language'];
    unit = json['unit'];
  }
  String? type;
  String? query;
  String? language;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['query'] = query;
    map['language'] = language;
    map['unit'] = unit;
    return map;
  }

}