class StormGlassModel {
  StormGlassModel({
    this.hours,
    this.meta,
  });

  StormGlassModel.fromJson(dynamic json) {
    if (json['hours'] != null) {
      hours = [];
      json['hours'].forEach((v) {
        hours?.add(Hours.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  List<Hours>? hours;
  Meta? meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (hours != null) {
      map['hours'] = hours?.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    return map;
  }
}

class Meta {
  Meta({
    this.cost,
    this.dailyQuota,
    this.end,
    this.lat,
    this.lng,
    this.params,
    this.requestCount,
    this.start,
  });

  Meta.fromJson(dynamic json) {
    cost = json['cost'];
    dailyQuota = json['dailyQuota'];
    end = json['end'];
    lat = json['lat'];
    lng = json['lng'];
    params = json['params'] != null ? json['params'].cast<String>() : [];
    requestCount = json['requestCount'];
    start = json['start'];
  }
  int? cost;
  int? dailyQuota;
  String? end;
  double? lat;
  double? lng;
  List<String>? params;
  int? requestCount;
  String? start;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cost'] = cost;
    map['dailyQuota'] = dailyQuota;
    map['end'] = end;
    map['lat'] = lat;
    map['lng'] = lng;
    map['params'] = params;
    map['requestCount'] = requestCount;
    map['start'] = start;
    return map;
  }
}

class Hours {
  Hours({
    this.airTemperature,
    this.humidity,
    this.precipitation,
    this.pressure,
    this.time,
    this.visibility,
    this.windSpeed,
  });

  Hours.fromJson(dynamic json) {
    airTemperature = json['airTemperature'] != null
        ? AirTemperature.fromJson(json['airTemperature'])
        : null;
    humidity =
        json['humidity'] != null ? Humidity.fromJson(json['humidity']) : null;
    precipitation = json['precipitation'] != null
        ? Precipitation.fromJson(json['precipitation'])
        : null;
    pressure =
        json['pressure'] != null ? Pressure.fromJson(json['pressure']) : null;
    time = json['time'];
    visibility = json['visibility'] != null
        ? Visibility.fromJson(json['visibility'])
        : null;
    windSpeed = json['windSpeed'] != null
        ? WindSpeed.fromJson(json['windSpeed'])
        : null;
  }
  AirTemperature? airTemperature;
  Humidity? humidity;
  Precipitation? precipitation;
  Pressure? pressure;
  String? time;
  Visibility? visibility;
  WindSpeed? windSpeed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (airTemperature != null) {
      map['airTemperature'] = airTemperature?.toJson();
    }
    if (humidity != null) {
      map['humidity'] = humidity?.toJson();
    }
    if (precipitation != null) {
      map['precipitation'] = precipitation?.toJson();
    }
    if (pressure != null) {
      map['pressure'] = pressure?.toJson();
    }
    map['time'] = time;
    if (visibility != null) {
      map['visibility'] = visibility?.toJson();
    }
    if (windSpeed != null) {
      map['windSpeed'] = windSpeed?.toJson();
    }
    return map;
  }
}

class WindSpeed {
  WindSpeed({
    this.noaa,
    this.sg,
  });

  WindSpeed.fromJson(dynamic json) {
    noaa = json['noaa'];
    sg = json['sg'];
  }
  dynamic? noaa;
  dynamic? sg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['noaa'] = noaa;
    map['sg'] = sg;
    return map;
  }
}

class Visibility {
  Visibility({
    this.noaa,
    this.sg,
  });

  Visibility.fromJson(dynamic json) {
    noaa = json['noaa'];
    sg = json['sg'];
  }
  double? noaa;
  double? sg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['noaa'] = noaa;
    map['sg'] = sg;
    return map;
  }
}

class Pressure {
  Pressure({
    this.noaa,
    this.sg,
  });

  Pressure.fromJson(dynamic json) {
    noaa = json['noaa'];
    sg = json['sg'];
  }
  double? noaa;
  double? sg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['noaa'] = noaa;
    map['sg'] = sg;
    return map;
  }
}

class Precipitation {
  Precipitation({
    this.noaa,
    this.sg,
  });

  Precipitation.fromJson(dynamic json) {
    noaa = json['noaa'];
    sg = json['sg'];
  }
  double? noaa;
  double? sg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['noaa'] = noaa;
    map['sg'] = sg;
    return map;
  }
}

class Humidity {
  Humidity({
    this.noaa,
    this.sg,
  });

  Humidity.fromJson(dynamic json) {
    noaa = json['noaa'];
    sg = json['sg'];
  }
  double? noaa;
  double? sg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['noaa'] = noaa;
    map['sg'] = sg;
    return map;
  }
}

class AirTemperature {
  AirTemperature({
    this.noaa,
    this.sg,
  });

  AirTemperature.fromJson(dynamic json) {
    noaa = json['noaa'];
    sg = json['sg'];
  }
  double? noaa;
  double? sg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['noaa'] = noaa;
    map['sg'] = sg;
    return map;
  }
}
