class VisualCrossingModel {
  VisualCrossingModel({
    this.queryCost,
    this.latitude,
    this.longitude,
    this.resolvedAddress,
    this.address,
    this.timezone,
    this.tzoffset,
    this.description,
    this.days,
    this.stations,
    this.currentConditions,
  });

  VisualCrossingModel.fromJson(dynamic json) {
    queryCost = json['queryCost'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    resolvedAddress = json['resolvedAddress'];
    address = json['address'];
    timezone = json['timezone'];
    tzoffset = json['tzoffset'];
    description = json['description'];
    if (json['days'] != null) {
      days = [];
      json['days'].forEach((v) {
        days?.add(Days.fromJson(v));
      });
    }
    stations =
        json['stations'] != null ? Stations.fromJson(json['stations']) : null;
    currentConditions = json['currentConditions'] != null
        ? CurrentConditions.fromJson(json['currentConditions'])
        : null;
  }
  int? queryCost;
  double? latitude;
  double? longitude;
  String? resolvedAddress;
  String? address;
  String? timezone;
  double? tzoffset;
  String? description;
  List<Days>? days;
  Stations? stations;
  CurrentConditions? currentConditions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['queryCost'] = queryCost;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['resolvedAddress'] = resolvedAddress;
    map['address'] = address;
    map['timezone'] = timezone;
    map['tzoffset'] = tzoffset;
    map['description'] = description;
    if (days != null) {
      map['days'] = days?.map((v) => v.toJson()).toList();
    }
    if (stations != null) {
      map['stations'] = stations?.toJson();
    }
    if (currentConditions != null) {
      map['currentConditions'] = currentConditions?.toJson();
    }
    return map;
  }
}

class CurrentConditions {
  CurrentConditions({
    this.datetime,
    this.datetimeEpoch,
    this.temp,
    this.feelslike,
    this.humidity,
    this.dew,
    this.precip,
    this.precipprob,
    this.snow,
    this.snowdepth,
    this.preciptype,
    this.windgust,
    this.windspeed,
    this.winddir,
    this.pressure,
    this.visibility,
    this.cloudcover,
    this.solarradiation,
    this.solarenergy,
    this.uvindex,
    this.conditions,
    this.icon,
    this.stations,
    this.sunrise,
    this.sunriseEpoch,
    this.sunset,
    this.sunsetEpoch,
    this.moonphase,
  });

  CurrentConditions.fromJson(dynamic json) {
    datetime = json['datetime'];
    datetimeEpoch = json['datetimeEpoch'];
    temp = json['temp'];
    feelslike = json['feelslike'];
    humidity = json['humidity'];
    dew = json['dew'];
    precip = json['precip'];
    precipprob = json['precipprob'];
    snow = json['snow'];
    snowdepth = json['snowdepth'];
    preciptype = json['preciptype'];
    windgust = json['windgust'];
    windspeed = json['windspeed'];
    winddir = json['winddir'];
    pressure = json['pressure'];
    visibility = json['visibility'];
    cloudcover = json['cloudcover'];
    solarradiation = json['solarradiation'];
    solarenergy = json['solarenergy'];
    uvindex = json['uvindex'];
    conditions = json['conditions'];
    icon = json['icon'];
    stations = json['stations'] != null ? json['stations'].cast<String>() : [];
    sunrise = json['sunrise'];
    sunriseEpoch = json['sunriseEpoch'];
    sunset = json['sunset'];
    sunsetEpoch = json['sunsetEpoch'];
    moonphase = json['moonphase'];
  }
  String? datetime;
  int? datetimeEpoch;
  double? temp;
  double? feelslike;
  double? humidity;
  double? dew;
  dynamic precip;
  dynamic precipprob;
  dynamic snow;
  double? snowdepth;
  dynamic preciptype;
  dynamic windgust;
  double? windspeed;
  double? winddir;
  double? pressure;
  double? visibility;
  double? cloudcover;
  dynamic solarradiation;
  dynamic solarenergy;
  dynamic uvindex;
  String? conditions;
  String? icon;
  List<String>? stations;
  String? sunrise;
  int? sunriseEpoch;
  String? sunset;
  int? sunsetEpoch;
  double? moonphase;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['datetime'] = datetime;
    map['datetimeEpoch'] = datetimeEpoch;
    map['temp'] = temp;
    map['feelslike'] = feelslike;
    map['humidity'] = humidity;
    map['dew'] = dew;
    map['precip'] = precip;
    map['precipprob'] = precipprob;
    map['snow'] = snow;
    map['snowdepth'] = snowdepth;
    map['preciptype'] = preciptype;
    map['windgust'] = windgust;
    map['windspeed'] = windspeed;
    map['winddir'] = winddir;
    map['pressure'] = pressure;
    map['visibility'] = visibility;
    map['cloudcover'] = cloudcover;
    map['solarradiation'] = solarradiation;
    map['solarenergy'] = solarenergy;
    map['uvindex'] = uvindex;
    map['conditions'] = conditions;
    map['icon'] = icon;
    map['stations'] = stations;
    map['sunrise'] = sunrise;
    map['sunriseEpoch'] = sunriseEpoch;
    map['sunset'] = sunset;
    map['sunsetEpoch'] = sunsetEpoch;
    map['moonphase'] = moonphase;
    return map;
  }
}

class Stations {
  Stations({
    this.viar,
    this.opla,
  });

  Stations.fromJson(dynamic json) {
    viar = json['VIAR'] != null ? VIAR.fromJson(json['VIAR']) : null;
    opla = json['OPLA'] != null ? OPLA.fromJson(json['OPLA']) : null;
  }
  VIAR? viar;
  OPLA? opla;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (viar != null) {
      map['VIAR'] = viar?.toJson();
    }
    if (opla != null) {
      map['OPLA'] = opla?.toJson();
    }
    return map;
  }
}

class OPLA {
  OPLA({
    this.distance,
    this.latitude,
    this.longitude,
    this.useCount,
    this.id,
    this.name,
    this.quality,
    this.contribution,
  });

  OPLA.fromJson(dynamic json) {
    distance = json['distance'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    useCount = json['useCount'];
    id = json['id'];
    name = json['name'];
    quality = json['quality'];
    contribution = json['contribution'];
  }
  double? distance;
  double? latitude;
  double? longitude;
  int? useCount;
  String? id;
  String? name;
  int? quality;
  double? contribution;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['distance'] = distance;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['useCount'] = useCount;
    map['id'] = id;
    map['name'] = name;
    map['quality'] = quality;
    map['contribution'] = contribution;
    return map;
  }
}

class VIAR {
  VIAR({
    this.distance,
    this.latitude,
    this.longitude,
    this.useCount,
    this.id,
    this.name,
    this.quality,
    this.contribution,
  });

  VIAR.fromJson(dynamic json) {
    distance = json['distance'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    useCount = json['useCount'];
    id = json['id'];
    name = json['name'];
    quality = json['quality'];
    contribution = json['contribution'];
  }
  double? distance;
  double? latitude;
  double? longitude;
  int? useCount;
  String? id;
  String? name;
  int? quality;
  double? contribution;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['distance'] = distance;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['useCount'] = useCount;
    map['id'] = id;
    map['name'] = name;
    map['quality'] = quality;
    map['contribution'] = contribution;
    return map;
  }
}

class Days {
  Days({
    this.datetime,
    this.datetimeEpoch,
    this.tempmax,
    this.tempmin,
    this.temp,
    this.feelslikemax,
    this.feelslikemin,
    this.feelslike,
    this.dew,
    this.humidity,
    this.precip,
    this.precipprob,
    this.precipcover,
    this.preciptype,
    this.snow,
    this.snowdepth,
    this.windgust,
    this.windspeed,
    this.winddir,
    this.pressure,
    this.cloudcover,
    this.visibility,
    this.solarradiation,
    this.solarenergy,
    this.uvindex,
    this.severerisk,
    this.sunrise,
    this.sunriseEpoch,
    this.sunset,
    this.sunsetEpoch,
    this.moonphase,
    this.conditions,
    this.description,
    this.icon,
    this.stations,
    this.source,
    this.hours,
  });

  Days.fromJson(dynamic json) {
    datetime = json['datetime'];
    datetimeEpoch = json['datetimeEpoch'];
    tempmax = json['tempmax'];
    tempmin = json['tempmin'];
    temp = json['temp'];
    feelslikemax = json['feelslikemax'];
    feelslikemin = json['feelslikemin'];
    feelslike = json['feelslike'];
    dew = json['dew'];
    humidity = json['humidity'];
    precip = json['precip'];
    precipprob = json['precipprob'];
    precipcover = json['precipcover'];
    preciptype = json['preciptype'];
    snow = json['snow'];
    snowdepth = json['snowdepth'];
    windgust = json['windgust'];
    windspeed = json['windspeed'];
    winddir = json['winddir'];
    pressure = json['pressure'];
    cloudcover = json['cloudcover'];
    visibility = json['visibility'];
    solarradiation = json['solarradiation'];
    solarenergy = json['solarenergy'];
    uvindex = json['uvindex'];
    severerisk = json['severerisk'];
    sunrise = json['sunrise'];
    sunriseEpoch = json['sunriseEpoch'];
    sunset = json['sunset'];
    sunsetEpoch = json['sunsetEpoch'];
    moonphase = json['moonphase'];
    conditions = json['conditions'];
    description = json['description'];
    icon = json['icon'];
    stations = json['stations'] != null ? json['stations'].cast<String>() : [];
    source = json['source'];
    if (json['hours'] != null) {
      hours = [];
      json['hours'].forEach((v) {
        hours?.add(Hours.fromJson(v));
      });
    }
  }
  String? datetime;
  int? datetimeEpoch;
  dynamic? tempmax;
  dynamic? tempmin;
  double? temp;
  double? feelslikemax;
  double? feelslikemin;
  double? feelslike;
  double? dew;
  double? humidity;
  double? precip;
  double? precipprob;
  dynamic precipcover;
  dynamic preciptype;
  double? snow;
  double? snowdepth;
  double? windgust;
  double? windspeed;
  double? winddir;
  double? pressure;
  double? cloudcover;
  double? visibility;
  double? solarradiation;
  double? solarenergy;
  double? uvindex;
  double? severerisk;
  String? sunrise;
  int? sunriseEpoch;
  String? sunset;
  int? sunsetEpoch;
  double? moonphase;
  String? conditions;
  String? description;
  String? icon;
  List<String>? stations;
  String? source;
  List<Hours>? hours;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['datetime'] = datetime;
    map['datetimeEpoch'] = datetimeEpoch;
    map['tempmax'] = tempmax;
    map['tempmin'] = tempmin;
    map['temp'] = temp;
    map['feelslikemax'] = feelslikemax;
    map['feelslikemin'] = feelslikemin;
    map['feelslike'] = feelslike;
    map['dew'] = dew;
    map['humidity'] = humidity;
    map['precip'] = precip;
    map['precipprob'] = precipprob;
    map['precipcover'] = precipcover;
    map['preciptype'] = preciptype;
    map['snow'] = snow;
    map['snowdepth'] = snowdepth;
    map['windgust'] = windgust;
    map['windspeed'] = windspeed;
    map['winddir'] = winddir;
    map['pressure'] = pressure;
    map['cloudcover'] = cloudcover;
    map['visibility'] = visibility;
    map['solarradiation'] = solarradiation;
    map['solarenergy'] = solarenergy;
    map['uvindex'] = uvindex;
    map['severerisk'] = severerisk;
    map['sunrise'] = sunrise;
    map['sunriseEpoch'] = sunriseEpoch;
    map['sunset'] = sunset;
    map['sunsetEpoch'] = sunsetEpoch;
    map['moonphase'] = moonphase;
    map['conditions'] = conditions;
    map['description'] = description;
    map['icon'] = icon;
    map['stations'] = stations;
    map['source'] = source;
    if (hours != null) {
      map['hours'] = hours?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Hours {
  Hours({
    this.datetime,
    this.datetimeEpoch,
    this.temp,
    this.feelslike,
    this.humidity,
    this.dew,
    this.precip,
    this.precipprob,
    this.snow,
    this.snowdepth,
    this.preciptype,
    this.windgust,
    this.windspeed,
    this.winddir,
    this.pressure,
    this.visibility,
    this.cloudcover,
    this.solarradiation,
    this.solarenergy,
    this.uvindex,
    this.conditions,
    this.icon,
    this.stations,
    this.source,
  });

  Hours.fromJson(dynamic json) {
    datetime = json['datetime'];
    datetimeEpoch = json['datetimeEpoch'];
    temp = json['temp'];
    feelslike = json['feelslike'];
    humidity = json['humidity'];
    dew = json['dew'];
    precip = json['precip'];
    precipprob = json['precipprob'];
    snow = json['snow'];
    snowdepth = json['snowdepth'];
    preciptype = json['preciptype'];
    windgust = json['windgust'];
    windspeed = json['windspeed'];
    winddir = json['winddir'];
    pressure = json['pressure'];
    visibility = json['visibility'];
    cloudcover = json['cloudcover'];
    solarradiation = json['solarradiation'];
    solarenergy = json['solarenergy'];
    uvindex = json['uvindex'];
    conditions = json['conditions'];
    icon = json['icon'];
    stations = json['stations'] != null ? json['stations'].cast<String>() : [];
    source = json['source'];
  }
  String? datetime;
  int? datetimeEpoch;
  double? temp;
  double? feelslike;
  double? humidity;
  double? dew;
  dynamic precip;
  dynamic precipprob;
  dynamic snow;
  dynamic snowdepth;
  dynamic preciptype;
  dynamic windgust;
  double? windspeed;
  double? winddir;
  double? pressure;
  double? visibility;
  dynamic cloudcover;
  dynamic solarradiation;
  dynamic solarenergy;
  double? uvindex;
  String? conditions;
  String? icon;
  List<String>? stations;
  String? source;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['datetime'] = datetime;
    map['datetimeEpoch'] = datetimeEpoch;
    map['temp'] = temp;
    map['feelslike'] = feelslike;
    map['humidity'] = humidity;
    map['dew'] = dew;
    map['precip'] = precip;
    map['precipprob'] = precipprob;
    map['snow'] = snow;
    map['snowdepth'] = snowdepth;
    map['preciptype'] = preciptype;
    map['windgust'] = windgust;
    map['windspeed'] = windspeed;
    map['winddir'] = winddir;
    map['pressure'] = pressure;
    map['visibility'] = visibility;
    map['cloudcover'] = cloudcover;
    map['solarradiation'] = solarradiation;
    map['solarenergy'] = solarenergy;
    map['uvindex'] = uvindex;
    map['conditions'] = conditions;
    map['icon'] = icon;
    map['stations'] = stations;
    map['source'] = source;
    return map;
  }
}
