import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/api_requests/api_get_requests.dart';
import 'package:weather/api_requests/api_path.dart';
import 'package:weather/model/bit_weather_model.dart';
import 'package:weather/model/open_weather_model.dart';
import 'package:weather/model/simple_weather_api.dart';
import 'package:weather/model/stack_weather_model.dart';
import 'package:weather/model/storm_glass_model.dart';
import 'package:weather/model/visual_crossing_model.dart';
import 'check_internet_connection.dart';

Future<OpenWeatherModel> getOpenWeather(String queryLocation) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String url = ApiPaths.openWeatherBaseUrl + queryLocation + ApiPaths.openWeatherKey;
  OpenWeatherModel openWeatherModel = OpenWeatherModel();
  var data;
  if (await isInternet()) {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      await preferences.setString("openWeatherModel", response.body.toString());
      data = json.decode(preferences.getString("openWeatherModel") ?? "");
      openWeatherModel = OpenWeatherModel.fromJson(data);
      return openWeatherModel;
    } else {
      if (preferences.containsKey("openWeatherModel")) {
        data = json.decode(preferences.getString("openWeatherModel") ?? "");
        openWeatherModel = OpenWeatherModel.fromJson(data);
        return openWeatherModel;
      } else {
        return openWeatherModel;
      }
    }
  } else {
    if (preferences.containsKey("openWeatherModel")) {
      data = json.decode(preferences.getString("openWeatherModel") ?? "");
      openWeatherModel = OpenWeatherModel.fromJson(data);
      return openWeatherModel;
    } else {
      return openWeatherModel;
    }
  }
}

Future<OpenWeatherModel> openWeatherData(String queryLocation) async {
  OpenWeatherModel openWeatherModel = OpenWeatherModel();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String mainurl = ApiPaths.openWeatherBaseUrl + queryLocation + ApiPaths.openWeatherKey;
  var data;
  if (await isInternet()) {
    ApiRequest request = ApiRequest(
      url: mainurl,
    );
    request.get().then((value) async {
      if (value.statusCode == 200) {
        await preferences.setString("openWeatherModel", value.body.toString());
        data = json.decode(preferences.getString("openWeatherModel") ?? "");
        openWeatherModel = OpenWeatherModel.fromJson(data);
        return openWeatherModel;
      } else {
        if (preferences.containsKey("openWeatherModel")) {
          data = json.decode(preferences.getString("openWeatherModel") ?? "");
          openWeatherModel = OpenWeatherModel.fromJson(data);
          return openWeatherModel;
        } else {
          return openWeatherModel;
        }
      }
    });
  } else {
    if (preferences.containsKey("openWeatherModel")) {
      data = json.decode(preferences.getString("openWeatherModel") ?? "");
      openWeatherModel = OpenWeatherModel.fromJson(data);
      return openWeatherModel;
    } else {
      return openWeatherModel;
    }
  }

  return openWeatherModel;
}

Future<StackWeatherModel> getWeatherStack() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  StackWeatherModel stackWeatherModel = StackWeatherModel();
  var data;
  if (await isInternet()) {
    String url = ApiPaths.weatherStackUrl + ApiPaths.queryLocation;

    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      await preferences.setString("stackWeatherModel", response.body.toString());
      data = json.decode(preferences.getString("stackWeatherModel") ?? "");
      stackWeatherModel = StackWeatherModel.fromJson(data);
      return stackWeatherModel;
    } else {
      if (preferences.containsKey("stackWeatherModel")) {
        data = json.decode(preferences.getString("stackWeatherModel") ?? "");
        stackWeatherModel = StackWeatherModel.fromJson(data);
        return stackWeatherModel;
      } else {
        return stackWeatherModel;
      }
    }
  } else {
    if (preferences.containsKey("stackWeatherModel")) {
      data = json.decode(preferences.getString("stackWeatherModel") ?? "");
      stackWeatherModel = StackWeatherModel.fromJson(data);
      return stackWeatherModel;
    } else {
      return stackWeatherModel;
    }
  }
}

Future<VisualCrossingModel> getVisualCrossingWeather() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  VisualCrossingModel visualCrossingModel = VisualCrossingModel();
  var data;
  if (await isInternet()) {
    String url =
        ApiPaths.visualCrossingBaseUrl + ApiPaths.queryLocation + ApiPaths.visualCrossingKey;

    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      await preferences.setString("visualCrossingModel", response.body.toString());
      data = json.decode(preferences.getString("visualCrossingModel") ?? "");
      visualCrossingModel = VisualCrossingModel.fromJson(data);
      return visualCrossingModel;
    } else {
      if (preferences.containsKey("visualCrossingModel")) {
        data = json.decode(preferences.getString("visualCrossingModel") ?? "");
        visualCrossingModel = VisualCrossingModel.fromJson(data);
        return visualCrossingModel;
      } else {
        return visualCrossingModel;
      }
    }
  } else {
    if (preferences.containsKey("visualCrossingModel")) {
      data = json.decode(preferences.getString("visualCrossingModel") ?? "");
      visualCrossingModel = VisualCrossingModel.fromJson(data);
      return visualCrossingModel;
    } else {
      return visualCrossingModel;
    }
  }
}

Future<BitWeatherModel> getWeatherBit() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  BitWeatherModel bitWeatherModel = BitWeatherModel();
  var data;
  if (await isInternet()) {
    String url = ApiPaths.bitWeatherBaseUrl + ApiPaths.queryLocation + ApiPaths.auth;

    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      await preferences.setString("bitWeatherModel", response.body.toString());
      data = json.decode(preferences.getString("bitWeatherModel") ?? "");
      bitWeatherModel = BitWeatherModel.fromJson(data);
      return bitWeatherModel;
    } else {
      if (preferences.containsKey("bitWeatherModel")) {
        data = json.decode(preferences.getString("bitWeatherModel") ?? "");
        bitWeatherModel = BitWeatherModel.fromJson(data);
        return bitWeatherModel;
      } else {
        return bitWeatherModel;
      }
    }
  } else {
    if (preferences.containsKey("bitWeatherModel")) {
      data = json.decode(preferences.getString("bitWeatherModel") ?? "");
      bitWeatherModel = BitWeatherModel.fromJson(data);
      return bitWeatherModel;
    } else {
      return bitWeatherModel;
    }
  }
}

Future<SimpleWeatherApi> getWeatherApi() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  SimpleWeatherApi simpleWeatherApi = SimpleWeatherApi();
  var data;
  if (await isInternet()) {
    String url =
        ApiPaths.simpleWeatherBaseUrl + ApiPaths.queryLocation + ApiPaths.forecastSimpleWeather;

    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      await preferences.setString("simpleweather", response.body.toString());
      data = json.decode(preferences.getString("simpleweather") ?? "");
      simpleWeatherApi = SimpleWeatherApi.fromJson(data);
      return simpleWeatherApi;
    } else {
      if (preferences.containsKey("simpleweather")) {
        data = json.decode(preferences.getString("simpleweather") ?? "");
        simpleWeatherApi = SimpleWeatherApi.fromJson(data);
        return simpleWeatherApi;
      } else {
        return simpleWeatherApi;
      }
    }
  } else {
    if (preferences.containsKey("simpleweather")) {
      data = json.decode(preferences.getString("simpleweather") ?? "");
      simpleWeatherApi = SimpleWeatherApi.fromJson(data);
      return simpleWeatherApi;
    } else {
      return simpleWeatherApi;
    }
  }
}

Future<StormGlassModel> getStormGlassWeather() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  StormGlassModel stormGlassModel = StormGlassModel();
  var data;
  if (await isInternet()) {
    String url = ApiPaths.stormGlassBaseUrl + ApiPaths.queryLatLng + ApiPaths.stormGlassAuth;

    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      await preferences.setString("storm", response.body.toString());
      data = json.decode(preferences.getString("storm") ?? "");
      stormGlassModel = StormGlassModel.fromJson(data);
      return stormGlassModel;
    } else {
      if (preferences.containsKey("storm")) {
        data = json.decode(preferences.getString("storm") ?? "");
        stormGlassModel = StormGlassModel.fromJson(data);
        return stormGlassModel;
      } else {
        return stormGlassModel;
      }
    }
  } else {
    if (preferences.containsKey("storm")) {
      data = json.decode(preferences.getString("storm") ?? "");
      stormGlassModel = StormGlassModel.fromJson(data);
      return stormGlassModel;
    } else {
      return stormGlassModel;
    }
  }
}
