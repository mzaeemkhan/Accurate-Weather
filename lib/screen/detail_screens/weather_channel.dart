import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/constant/animation%20path.dart';
import 'package:weather/constant/colors.dart';
import 'package:weather/constant/iconpath.dart';
import 'package:weather/model/simple_weather_api.dart';
import 'package:weather/functions/check_internet_connection.dart';
import 'package:weather/widget/custom_icon.dart';
import 'package:weather/widget/custom_text.dart';
import 'package:weather/widget/nextday_detail_container.dart';
import 'package:weather/widget/nexthour_container.dart';

class WeatherApiDetailScreen extends StatefulWidget {
  SimpleWeatherApi simpleWeatherApi = SimpleWeatherApi();
  String address = 'Lahore';
  double height;
  double width;

  WeatherApiDetailScreen({Key? key, required this.height, required this.width, required this.address, required this.simpleWeatherApi}) : super(key: key);

  @override
  _WeatherApiDetailScreenState createState() => _WeatherApiDetailScreenState();
}

class _WeatherApiDetailScreenState extends State<WeatherApiDetailScreen> {
  late bool net = false;
  @override
  void initState() {
    super.initState();
    connectionCheck();
  }

  Future connectionCheck() async {
    if (await isInternet()) {
      setState(() {
        net = true;
      });
    } else {
      setState(() {
        net = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: CustomIcon(
              icon: IconPath.backArrow,
              color: AppColor.iconColor,
              size: 20,
            ),
          ),
        ),
        title: customText(widget.address, AppColor.textColor, 20, FontWeight.bold, "Poppins-Regular"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: widget.height * 0.4,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                height: 150.0,
                                width: 150.0,
                                child: net == true
                                    ? CachedNetworkImage(
                                        placeholder: (context, url) => const SpinKitChasingDots(
                                          color: AppColor.textColor,
                                        ),
                                        imageUrl: "https:" + widget.simpleWeatherApi.current!.condition!.icon.toString(),
                                        height: 150,
                                        width: 150,
                                        fit: BoxFit.fill,
                                      )
                                    : CustomIcon(
                                        icon: "assets/icons/night.png",
                                        color: AppColor.iconColor,
                                        size: 20,
                                      )),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                customText(widget.simpleWeatherApi.current!.tempC.toStringAsFixed(0) + "°", AppColor.headingTextColor, 30, FontWeight.bold, "Poppins-Regular"),
                                const SizedBox(
                                  height: 10,
                                ),
                                customText(widget.simpleWeatherApi.current!.condition!.text.toString(), AppColor.textColor, 20, FontWeight.bold, "Poppins-Regular"),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomIcon(icon: IconPath.thermometer, color: AppColor.iconColor, size: 20),
                                customText(widget.simpleWeatherApi.current!.pressureIn.toStringAsFixed(0) + " PSI", AppColor.textColor, 15, FontWeight.bold, "Poppins-Regular")
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomIcon(icon: IconPath.visibility, color: AppColor.iconColor, size: 20),
                                customText(widget.simpleWeatherApi.current!.visKm.toStringAsFixed(0) + " km", AppColor.textColor, 15, FontWeight.bold, "Poppins-Regular")
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomIcon(icon: IconPath.windSpeed, color: AppColor.iconColor, size: 20),
                                customText(widget.simpleWeatherApi.current!.windMph.toStringAsFixed(0) + " m/s", AppColor.textColor, 15, FontWeight.bold, "Poppins-Regular")
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customText("Today's Weather Details", AppColor.headingTextColor, 20, FontWeight.bold, "Poppins-Regular"),
                  const Divider(
                    color: Colors.white,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                ],
              ),
              Container(
                height: widget.height * 0.15,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColor.primaryColor),
                child: ListView.builder(
                    itemCount: widget.simpleWeatherApi.forecast!.forecastday![0].hour!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return nextHour(
                          DateTime.parse(widget.simpleWeatherApi.forecast!.forecastday![0].hour![index].time.toString()).format('h:00 a'),
                          net == true
                              ? CachedNetworkImage(
                                  placeholder: (context, url) => const SpinKitChasingDots(
                                        color: AppColor.textColor,
                                      ),
                                  imageUrl: "https:" + widget.simpleWeatherApi.current!.condition!.icon.toString())
                              : CustomIcon(
                                  icon: "assets/icons/night.png",
                                  color: AppColor.iconColor,
                                  size: 30,
                                ),
                          widget.simpleWeatherApi.forecast!.forecastday![0].hour![index].tempC.toStringAsFixed(0) + "°C",
                          widget.height * 0.15,
                          widget.width * 0.2);
                    }),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customText("Last Update ", AppColor.headingTextColor, 20, FontWeight.bold, "Poppins-Regular"),
                      customText(DateTime.parse(widget.simpleWeatherApi.current!.lastUpdated.toString()).format('l h:00 a'), AppColor.textColor, 18, FontWeight.bold, "Poppins-RegularPoppins-Regular"),
                    ],
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.simpleWeatherApi.forecast!.forecastday!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return nextDayDetail(
                            widget.height,
                            widget.width,
                            net == true
                                ? CachedNetworkImage(
                                    placeholder: (context, url) => const SpinKitChasingDots(
                                          color: AppColor.textColor,
                                        ),
                                    imageUrl: "https:" + widget.simpleWeatherApi.current!.condition!.icon.toString())
                                : CustomIcon(
                                    icon: "assets/icons/night.png",
                                    color: AppColor.iconColor,
                                    size: 30,
                                  ),
                            DateTime.parse(widget.simpleWeatherApi.forecast!.forecastday![index].date.toString()).format("l"),
                            widget.simpleWeatherApi.forecast!.forecastday![index].day!.maxtempC.toStringAsFixed(0) + "°",
                            widget.simpleWeatherApi.forecast!.forecastday![index].day!.avgtempC.toStringAsFixed(0) + "°",
                            ((widget.simpleWeatherApi.forecast!.forecastday![index].day!.avgtempC) / (widget.simpleWeatherApi.forecast!.forecastday![index].day!.maxtempC)));
                      }),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: widget.width,
                    child: Lottie.asset(AnimationPath.sunRiseSunSet),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText(widget.simpleWeatherApi.forecast!.forecastday![0].astro!.sunrise.toString(), AppColor.textColor, 15, FontWeight.normal, "Poppins-RegularPoppins-Regular"),
                      customText(widget.simpleWeatherApi.forecast!.forecastday![0].astro!.sunset.toString(), AppColor.textColor, 15, FontWeight.normal, "Poppins-RegularPoppins-Regular")
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
