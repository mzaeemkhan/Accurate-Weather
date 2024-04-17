class BitWeatherModel {
  BitWeatherModel({
    this.data,
    this.cityName,
    this.lon,
    this.timezone,
    this.lat,
    this.countryCode,
    this.stateCode,
  });

  BitWeatherModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    cityName = json['city_name'];
    lon = json['lon'];
    timezone = json['timezone'];
    lat = json['lat'];
    countryCode = json['country_code'];
    stateCode = json['state_code'];
  }
  List<Data>? data;
  String? cityName;
  String? lon;
  String? timezone;
  String? lat;
  String? countryCode;
  String? stateCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['city_name'] = cityName;
    map['lon'] = lon;
    map['timezone'] = timezone;
    map['lat'] = lat;
    map['country_code'] = countryCode;
    map['state_code'] = stateCode;
    return map;
  }
}

class Data {
  Data({
    this.moonriseTs,
    this.windCdir,
    this.rh,
    this.pres,
    this.highTemp,
    this.sunsetTs,
    this.ozone,
    this.moonPhase,
    this.windGustSpd,
    this.snowDepth,
    this.clouds,
    this.ts,
    this.sunriseTs,
    this.appMdynamicemp,
    this.windSpd,
    this.pop,
    this.windCdirFull,
    this.slp,
    this.moonPhaseLunation,
    this.validDate,
    this.appMaxTemp,
    this.vis,
    this.dewpt,
    this.snow,
    this.uv,
    this.weather,
    this.windDir,
    this.maxDhi,
    this.cloudsHi,
    this.precip,
    this.lowTemp,
    this.maxTemp,
    this.moonsetTs,
    this.datetime,
    this.temp,
    this.mdynamicemp,
    this.cloudsMid,
    this.cloudsLow,
  });

  Data.fromJson(dynamic json) {
    moonriseTs = json['moonrise_ts'];
    windCdir = json['wind_cdir'];
    rh = json['rh'];
    pres = json['pres'];
    highTemp = json['high_temp'];
    sunsetTs = json['sunset_ts'];
    ozone = json['ozone'];
    moonPhase = json['moon_phase'];
    windGustSpd = json['wind_gust_spd'];
    snowDepth = json['snow_depth'];
    clouds = json['clouds'];
    ts = json['ts'];
    sunriseTs = json['sunrise_ts'];
    appMdynamicemp = json['app_min_temp'];
    windSpd = json['wind_spd'];
    pop = json['pop'];
    windCdirFull = json['wind_cdir_full'];
    slp = json['slp'];
    moonPhaseLunation = json['moon_phase_lunation'];
    validDate = json['valid_date'];
    appMaxTemp = json['app_max_temp'];
    vis = json['vis'];
    dewpt = json['dewpt'];
    snow = json['snow'];
    uv = json['uv'];
    weather =
        json['weather'] != null ? Weather.fromJson(json['weather']) : null;
    windDir = json['wind_dir'];
    maxDhi = json['max_dhi'];
    cloudsHi = json['clouds_hi'];
    precip = json['precip'];
    lowTemp = json['low_temp'];
    maxTemp = json['max_temp'];
    moonsetTs = json['moonset_ts'];
    datetime = json['datetime'];
    temp = json['temp'];
    mdynamicemp = json['min_temp'];
    cloudsMid = json['clouds_mid'];
    cloudsLow = json['clouds_low'];
  }
  dynamic? moonriseTs;
  String? windCdir;
  dynamic? rh;
  dynamic? pres;
  dynamic? highTemp;
  dynamic? sunsetTs;
  dynamic? ozone;
  dynamic? moonPhase;
  dynamic? windGustSpd;
  dynamic? snowDepth;
  dynamic? clouds;
  dynamic? ts;
  dynamic? sunriseTs;
  dynamic? appMdynamicemp;
  dynamic? windSpd;
  dynamic? pop;
  String? windCdirFull;
  dynamic? slp;
  dynamic? moonPhaseLunation;
  String? validDate;
  dynamic? appMaxTemp;
  dynamic? vis;
  dynamic? dewpt;
  dynamic? snow;
  dynamic? uv;
  Weather? weather;
  dynamic? windDir;
  dynamic maxDhi;
  dynamic? cloudsHi;
  dynamic? precip;
  dynamic? lowTemp;
  dynamic? maxTemp;
  dynamic? moonsetTs;
  String? datetime;
  dynamic? temp;
  dynamic? mdynamicemp;
  dynamic? cloudsMid;
  dynamic? cloudsLow;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['moonrise_ts'] = moonriseTs;
    map['wind_cdir'] = windCdir;
    map['rh'] = rh;
    map['pres'] = pres;
    map['high_temp'] = highTemp;
    map['sunset_ts'] = sunsetTs;
    map['ozone'] = ozone;
    map['moon_phase'] = moonPhase;
    map['wind_gust_spd'] = windGustSpd;
    map['snow_depth'] = snowDepth;
    map['clouds'] = clouds;
    map['ts'] = ts;
    map['sunrise_ts'] = sunriseTs;
    map['app_min_temp'] = appMdynamicemp;
    map['wind_spd'] = windSpd;
    map['pop'] = pop;
    map['wind_cdir_full'] = windCdirFull;
    map['slp'] = slp;
    map['moon_phase_lunation'] = moonPhaseLunation;
    map['valid_date'] = validDate;
    map['app_max_temp'] = appMaxTemp;
    map['vis'] = vis;
    map['dewpt'] = dewpt;
    map['snow'] = snow;
    map['uv'] = uv;
    if (weather != null) {
      map['weather'] = weather?.toJson();
    }
    map['wind_dir'] = windDir;
    map['max_dhi'] = maxDhi;
    map['clouds_hi'] = cloudsHi;
    map['precip'] = precip;
    map['low_temp'] = lowTemp;
    map['max_temp'] = maxTemp;
    map['moonset_ts'] = moonsetTs;
    map['datetime'] = datetime;
    map['temp'] = temp;
    map['min_temp'] = mdynamicemp;
    map['clouds_mid'] = cloudsMid;
    map['clouds_low'] = cloudsLow;
    return map;
  }
}

class Weather {
  Weather({
    this.icon,
    this.code,
    this.description,
  });

  Weather.fromJson(dynamic json) {
    icon = json['icon'];
    code = json['code'];
    description = json['description'];
  }
  String? icon;
  dynamic? code;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['icon'] = icon;
    map['code'] = code;
    map['description'] = description;
    return map;
  }
}
