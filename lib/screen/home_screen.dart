import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/api_requests/api_path.dart';
import 'package:weather/constant/colors.dart';
import 'package:weather/constant/iconpath.dart';
import 'package:weather/model/bit_weather_model.dart';
import 'package:weather/model/open_weather_model.dart';
import 'package:weather/model/simple_weather_api.dart';
import 'package:weather/model/stack_weather_model.dart';
import 'package:weather/model/storm_glass_model.dart';
import 'package:weather/model/visual_crossing_model.dart';
import 'package:weather/functions/check_internet_connection.dart';
import 'package:weather/functions/response_decoder.dart';
import 'package:weather/functions/string_titlecase.dart';
import 'package:weather/widget/custom_icon.dart';
import 'package:weather/widget/custom_text.dart';
import 'package:weather/widget/my_drawer.dart';
import 'package:weather/widget/nextday_container.dart';
import 'detail_screens/openweather.dart';
import 'detail_screens/visual_crossing.dart';
import 'detail_screens/weather_bit.dart';
import 'detail_screens/weather_channel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
@override
class _HomeScreenState extends State<HomeScreen> {
  OpenWeatherModel openWeatherModel = OpenWeatherModel();
  StackWeatherModel stackWeatherModel = StackWeatherModel();
  BitWeatherModel bitWeatherModel = BitWeatherModel();
  VisualCrossingModel visualCrossingModel = VisualCrossingModel();
  SimpleWeatherApi simpleWeatherApi = SimpleWeatherApi();
  StormGlassModel stormGlassModel = StormGlassModel();

  late Position currentPosition;
  late String currentAddress;
  late String currentAddressLocality;

  late LocationPermission permission;
  late bool serviceEnabled;
  @override
  initState() {
    super.initState();
    launchApp();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 600) {
        height = width;
      } else if (constraints.maxHeight < 600) {
        height = 650;
        width = 370;
      }
      return openWeatherModel.weatherList != null &&
              visualCrossingModel.currentConditions != null &&
              simpleWeatherApi.current != null &&
              stackWeatherModel.current != null &&
              bitWeatherModel.data != null &&
              stormGlassModel.meta != null
          ? Scaffold(
              key: _scaffoldKey,
              backgroundColor: AppColor.primaryColor,
              appBar: AppBar(
                backgroundColor: AppColor.primaryColor,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                    onTap: () async {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    child: CustomIcon(icon: IconPath.drawer, color: AppColor.iconColor, size: 15,),
                  ),
                ),
                title: customText(currentAddress, AppColor.textColor, 20, FontWeight.bold, "Poppins-Regular"),
                centerTitle: true,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () async {
                        if (await isInternet()) {
                          setState(() {
                            locationGet();
                            const snackBar = SnackBar(
                                content: Text('Updating Weather!'),
                                duration: Duration(milliseconds: 1000));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          });
                        } else {
                          showDialog(
                              barrierColor: AppColor.primaryColor.withOpacity(0.5),
                              context: context,
                              builder: (BuildContext ctx) {
                                return AlertDialog(
                                  backgroundColor: AppColor.secondaryColor,
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomIcon(
                                        icon: IconPath.noInternet,
                                        color: AppColor.iconColor,
                                        size: 30,
                                      ),
                                      customText(
                                          "No Internet Connection!",
                                          AppColor.headingTextColor,
                                          15,
                                          FontWeight.normal,
                                          "Poppins-Regular"),
                                    ],
                                  ),
                                  actions: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: customText("Ok", AppColor.headingTextColor, 20,
                                            FontWeight.normal, "Poppins-Regular"),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        }
                      },
                      child:
                          CustomIcon(icon: IconPath.refresh, color: AppColor.iconColor, size: 25),
                    ),
                  )
                ],
              ),
              drawer:MyDrawer(height: height,width:width ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OpenWeatherDetailScreen(
                                          height: height,
                                          address: currentAddress,
                                          width: width,
                                          openWeatherModel: openWeatherModel,
                                        )));
                          },
                          child: Container(
                            height: height * 0.4,
                            width: width,
                            child: Container(
                              width: width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColor.secondaryColor),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 200.0,
                                          width: 200.0,
                                          child: Lottie.asset(
                                              "assets/animations/${openWeatherModel.weatherList![0].weather![0].icon}.json"),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              customText(
                                                  DateTime.parse(openWeatherModel
                                                          .weatherList![0].dtTxt
                                                          .toString())
                                                      .format('l'),
                                                  AppColor.textColor,
                                                  20,
                                                  FontWeight.bold,
                                                  "Poppins-Regular"),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              customText(
                                                  openWeatherModel.weatherList![0].main!.temp
                                                          .toStringAsFixed(0) +
                                                      "°C",
                                                  AppColor.headingTextColor,
                                                  30,
                                                  FontWeight.bold,
                                                  "Poppins-Regular"),
                                              customText(
                                                  openWeatherModel
                                                      .weatherList![0].weather![0].description
                                                      .toString()
                                                      .toTitleCase,
                                                  AppColor.textColor,
                                                  20,
                                                  FontWeight.bold,
                                                  "Poppins-Regular"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                            child: Column(
                                          children: [
                                            customText("Wind Speed", AppColor.textColor, 15,
                                                FontWeight.bold, "Poppins-Regular"),
                                            const SizedBox(
                                              height: 5.0,
                                            ),
                                            Row(
                                              children: [
                                                CustomIcon(
                                                    icon: IconPath.windSpeed,
                                                    color: AppColor.iconColor,
                                                    size: 30.0),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                customText(
                                                    openWeatherModel.weatherList![0].wind!.speed
                                                            .toStringAsFixed(0) +
                                                        " M/s",
                                                    AppColor.textColor,
                                                    12,
                                                    FontWeight.bold,
                                                    "Poppins-Regular"),
                                              ],
                                            ),
                                          ],
                                        )),
                                        Container(
                                          width: 3.0,
                                          height: 35.0,
                                          color: AppColor.headingTextColor,
                                        ),
                                        Container(
                                            child: Column(
                                          children: [
                                            customText("Visibility", AppColor.textColor, 15,
                                                FontWeight.bold, "Poppins-Regular"),
                                            const SizedBox(
                                              height: 5.0,
                                            ),
                                            Row(
                                              children: [
                                                CustomIcon(
                                                    icon: IconPath.visibility,
                                                    color: AppColor.iconColor,
                                                    size: 30.0),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                customText(
                                                    (openWeatherModel.weatherList![0].visibility /
                                                                1000.0)
                                                            .toStringAsFixed(0) +
                                                        ' km',
                                                    AppColor.textColor,
                                                    12,
                                                    FontWeight.bold,
                                                    "Poppins-Regular"),
                                              ],
                                            ),
                                          ],
                                        )),
                                        Container(
                                          width: 3.0,
                                          height: 35.0,
                                          color: AppColor.headingTextColor,
                                        ),
                                        Container(
                                            child: Column(
                                          children: [
                                            customText("Feels Like", AppColor.textColor, 15,
                                                FontWeight.bold, "Poppins-Regular"),
                                            const SizedBox(
                                              height: 5.0,
                                            ),
                                            Row(
                                              children: [
                                                CustomIcon(
                                                    icon: IconPath.temp,
                                                    color: AppColor.iconColor,
                                                    size: 30.0),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                customText(
                                                    openWeatherModel.weatherList![0].main!.feelsLike
                                                            .toStringAsFixed(0) +
                                                        "°",
                                                    AppColor.textColor,
                                                    12,
                                                    FontWeight.bold,
                                                    "Poppins-Regular"),
                                              ],
                                            ),
                                          ],
                                        ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: height * 0.1,
                          width: width,
                          child: Center(
                            child: customText(
                                "Different Weather Stations",
                                AppColor.headingTextColor,
                                25,
                                FontWeight.normal,
                                "Poppins-Regular"),
                          ),
                        ),
                        Container(
                          height: height * 0.35,
                          width: width,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColor.primaryColor),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BitWeatherDetailScreen(
                                                height: height,
                                                width: width,
                                                bitWeatherModel: bitWeatherModel,
                                                address: currentAddress,
                                              )));
                                },
                                child: NextDay(
                                  height: height,
                                  width: width,
                                  color: AppColor.secondaryColor,
                                  condition:
                                      bitWeatherModel.data![0].weather!.description.toString(),
                                  station: "Weather Bit",
                                  path:
                                      'assets/bit_animations/${bitWeatherModel.data![0].weather!.icon}.json',
                                  temp: bitWeatherModel.data![0].temp.toStringAsFixed(0) + '°',
                                  windSpeed: bitWeatherModel.data![0].windSpd.toStringAsFixed(0),
                                  visibility: bitWeatherModel.data![0].vis.toStringAsFixed(0),
                                  iconPathOne: IconPath.windSpeed,
                                  iconPathTwo: IconPath.visibility,
                                  unit1: "m/s",
                                  unit2: "km",
                                  titleOne: 'Wind Speed',
                                  titleTwo: 'Visibility',
                                ),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => VisualCrossingDetailScreen(
                                                height: height,
                                                width: width,
                                                visualCrossingModel: visualCrossingModel,
                                                address: currentAddress,
                                              )));
                                },
                                child: NextDay(
                                  height: height,
                                  width: width,
                                  color: AppColor.secondaryColor,
                                  condition: simpleWeatherApi.current!.condition!.text.toString(),
                                  station: "Visual Crossing ",
                                  path:
                                      'assets/visual_cross_animations/${visualCrossingModel.currentConditions!.icon.toString()}.json',
                                  temp: visualCrossingModel.currentConditions!.temp!
                                          .toStringAsFixed(0) +
                                      '°',
                                  windSpeed: visualCrossingModel.currentConditions!.visibility!
                                      .toStringAsFixed(0),
                                  visibility: visualCrossingModel.currentConditions!.visibility!
                                      .toStringAsFixed(0),
                                  iconPathOne: IconPath.windSpeed,
                                  iconPathTwo: IconPath.visibility,
                                  unit1: "m/s",
                                  unit2: "km",
                                  titleOne: 'Wind Speed',
                                  titleTwo: 'Visibility',
                                ),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              InkWell(
                                onTap: () async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WeatherApiDetailScreen(
                                                height: height,
                                                width: width,
                                                simpleWeatherApi: simpleWeatherApi,
                                                address: currentAddress,
                                              )));
                                },
                                child: NextDay(
                                  height: height,
                                  width: width,
                                  color: AppColor.secondaryColor,
                                  condition: simpleWeatherApi.current!.condition!.text.toString(),
                                  station: "Weather Channel",
                                  path:
                                      'assets/visual_cross_animations/${visualCrossingModel.currentConditions!.icon.toString()}.json',
                                  temp: simpleWeatherApi.current!.tempC.toStringAsFixed(0) + '°',
                                  visibility: simpleWeatherApi.current!.visKm.toStringAsFixed(0),
                                  windSpeed: simpleWeatherApi.current!.windMph.toStringAsFixed(0),
                                  iconPathOne: IconPath.windSpeed,
                                  iconPathTwo: IconPath.visibility,
                                  unit1: "m/s",
                                  unit2: "km",
                                  titleOne: 'Wind Speed',
                                  titleTwo: 'Visibility',
                                ),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              InkWell(
                                onTap: () {
                                  const snackBar = SnackBar(
                                      duration: Duration(milliseconds: 1000),
                                      content: Text(
                                          'Forecast for Storm Glass is not available right now!'));
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                },
                                child: NextDay(
                                  height: height,
                                  width: width,
                                  color: AppColor.secondaryColor,
                                  condition:
                                      bitWeatherModel.data![0].weather!.description.toString(),
                                  station: "Storm Glass",
                                  path:
                                      "assets/animations/${openWeatherModel.weatherList![0].weather![0].icon}.json",
                                  temp: stormGlassModel.hours![0].airTemperature!.sg!
                                          .toStringAsFixed(0) +
                                      '°',
                                  windSpeed:
                                      stormGlassModel.hours![0].windSpeed!.noaa!.toStringAsFixed(0),
                                  visibility: stormGlassModel.hours![0].visibility!.noaa!
                                      .toStringAsFixed(0)
                                      .toString(),
                                  unit1: "M/s",
                                  unit2: "%",
                                  iconPathOne: IconPath.windSpeed,
                                  iconPathTwo: IconPath.temp,
                                  titleOne: 'Wind Speed',
                                  titleTwo: 'Humidity',
                                ),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              InkWell(
                                onTap: () {
                                  const snackBar = SnackBar(
                                      duration: Duration(milliseconds: 1000),
                                      content: Text(
                                          'Forecast for Weather Stack is not available right now!'));
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                },
                                child: NextDay(
                                  height: height,
                                  width: width,
                                  color: AppColor.secondaryColor,
                                  condition:
                                      stackWeatherModel.current!.weatherDescriptions![0].toString(),
                                  station: "Weather Stack",
                                  path:
                                      "assets/animations/${openWeatherModel.weatherList![0].weather![0].icon}.json",
                                  temp: stackWeatherModel.current!.temperature.toString() + '°',
                                  visibility: stackWeatherModel.current!.visibility.toString(),
                                  windSpeed: stackWeatherModel.current!.windSpeed.toString(),
                                  iconPathOne: IconPath.windSpeed,
                                  iconPathTwo: IconPath.visibility,
                                  unit1: "m/s",
                                  unit2: "km",
                                  titleOne: 'Wind Speed',
                                  titleTwo: 'Visibility',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : const SpinKitChasingDots(color: AppColor.textColor,);
    });
  }
  launchApp() async {
    if (await isInternet()) {
      locationGet();
    }
    else {
      showDialog(
          barrierColor: AppColor.primaryColor.withOpacity(0.5),
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              backgroundColor: AppColor.secondaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIcon(
                    icon: IconPath.noInternet,
                    color: AppColor.headingTextColor,
                    size: 30,
                  ),
                  customText("No Internet Connection!", AppColor.headingTextColor, 15,
                      FontWeight.normal, "Poppins-Regular"),
                ],
              ),
              content:  customText("Allow Connection", AppColor.textColor, 15,
                  FontWeight.normal, "Poppins-Regular"),
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    launchApp();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: customText(
                        "Ok", AppColor.headingTextColor, 20, FontWeight.normal, "Poppins-Regular"),
                  ),
                ),
              ],
            );
          });
    }
  }
  Future locationGet() async {
    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
       permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        SystemNavigator.pop();
      }
    }
    try {
      currentPosition =await Geolocator.getCurrentPosition( desiredAccuracy: LocationAccuracy.high);
      addressGet();
    }
    catch (e) {
      showDialog(
          barrierColor: AppColor.primaryColor.withOpacity(0.5),
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              backgroundColor: AppColor.secondaryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIcon(
                    icon: IconPath.noInternet,
                    color: AppColor.headingTextColor,
                    size: 30,
                  ),
                  customText("Location Service Disable!", AppColor.headingTextColor, 15,
                      FontWeight.normal, "Poppins-Regular"),
                ],
              ),
              content:  customText("Enable for Continue", AppColor.textColor, 15,
                  FontWeight.normal, "Poppins-Regular"),
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    launchApp();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: customText(
                        "Ok", AppColor.headingTextColor, 20, FontWeight.normal, "Poppins-Regular"),
                  ),
                ),
              ],
            );
          });
    }
  }
  addressGet() async {
    List<Placemark> location =
    await placemarkFromCoordinates(currentPosition.latitude, currentPosition.longitude);
    Placemark place = location[0];
    setState(() {
      currentAddress = "${place.subLocality}, ${place.locality}";
      currentAddressLocality = place.locality ?? "";
      ApiPaths.queryLocation = currentAddressLocality;
      ApiPaths.queryLatLng = "lat=${currentPosition.latitude}&lng=${currentPosition.longitude}";
      callData();
    });
  }
  void callData() {
    getOpenWeather(
      currentAddressLocality,
    ).then((value) {
      setState(() {
        openWeatherModel = value;
      });
    });
    getWeatherBit().then((value) {
      setState(() {
        bitWeatherModel = value;
      });
    });
    getWeatherStack().then((value) {
      setState(() {
        stackWeatherModel = value;
      });
    });

    getVisualCrossingWeather().then((value) {
      setState(() {
        visualCrossingModel = value;
      });
    });
    getWeatherApi().then((value) {
      setState(() {
        simpleWeatherApi = value;
      });
    });
    getStormGlassWeather().then((value) {
      setState(() {
        stormGlassModel = value;
      });
    });
  }
}
