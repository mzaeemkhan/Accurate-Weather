import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/constant/animation%20path.dart';
import 'package:weather/constant/colors.dart';
import 'package:weather/constant/iconpath.dart';
import 'package:weather/model/open_weather_model.dart';
import 'package:weather/functions/string_titlecase.dart';
import 'package:weather/widget/custom_icon.dart';
import 'package:weather/widget/custom_text.dart';
import 'package:weather/widget/nextday_detail_container.dart';
import 'package:date_time_format/date_time_format.dart';

class OpenWeatherDetailScreen extends StatefulWidget {
  OpenWeatherModel openWeatherModel = OpenWeatherModel();
  String address = 'Lahore';
  double height;
  double width;

  OpenWeatherDetailScreen(
      {Key? key,
      required this.height,
      required this.width,
      required this.address,
      required this.openWeatherModel})
      : super(key: key);

  @override
  _OpenWeatherDetailScreenState createState() =>
      _OpenWeatherDetailScreenState();
}

class _OpenWeatherDetailScreenState extends State<OpenWeatherDetailScreen> {
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
        title: customText(widget.address, AppColor.textColor, 20,
            FontWeight.bold, "Poppins-Regular"),
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
                                child: Image.asset(
                                  "assets/open_weather_icons/${widget.openWeatherModel.weatherList![0].weather![0].icon}.png",
                                  height: 150,
                                  width: 150,
                                  color: Colors.white,
                                  fit: BoxFit.fill,
                                )),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                customText(
                                    widget.openWeatherModel.weatherList![0]
                                            .main!.temp!
                                            .toStringAsFixed(0) +
                                        "°",
                                    AppColor.headingTextColor,
                                    30,
                                    FontWeight.bold,
                                    "Poppins-Regular"),
                                const SizedBox(
                                  height: 10,
                                ),
                                customText(
                                    widget.openWeatherModel.weatherList![0]
                                        .weather![0].description
                                        .toString()
                                        .toTitleCase,
                                    AppColor.textColor,
                                    20,
                                    FontWeight.bold,
                                    "Poppins-Regular")
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
                                CustomIcon(
                                    icon: IconPath.thermometer,
                                    color: AppColor.iconColor,
                                    size: 20),
                                customText(
                                    widget.openWeatherModel.weatherList![0]
                                            .main!.pressure
                                            .toStringAsFixed(0) +
                                        " hPa",
                                    AppColor.textColor,
                                    15,
                                    FontWeight.bold,
                                    "Poppins-Regular")
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomIcon(
                                    icon: IconPath.visibility,
                                    color: AppColor.iconColor,
                                    size: 20),
                                customText(
                                    (widget.openWeatherModel.weatherList![0]
                                                    .visibility /
                                                1000.0)
                                            .toStringAsFixed(0) +
                                        " km",
                                    AppColor.textColor,
                                    15,
                                    FontWeight.bold,
                                    "Poppins-Regular")
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomIcon(
                                    icon: IconPath.windSpeed,
                                    color: AppColor.iconColor,
                                    size: 20),
                                customText(
                                    widget.openWeatherModel.weatherList![0]
                                            .wind!.speed
                                            .toStringAsFixed(0) +
                                        " m/s",
                                    AppColor.textColor,
                                    15,
                                    FontWeight.bold,
                                    "Poppins-Regular")
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
                  customText("Weather Forecast", AppColor.headingTextColor, 20,
                      FontWeight.bold, "Poppins-Regular"),
                  const Divider(
                    color: Colors.white,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.openWeatherModel.weatherList!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return nextDayDetail(
                            widget.height,
                            widget.width,
                            Image.asset(
                              "assets/open_weather_icons/${widget.openWeatherModel.weatherList![index].weather![0].icon}.png",
                              color: Colors.white,
                            ),
                            DateTime.parse(widget
                                    .openWeatherModel.weatherList![index].dtTxt
                                    .toString())
                                .format("l\nh:00 a"),
                            widget.openWeatherModel.weatherList![index].main!
                                    .tempMax
                                    .toStringAsFixed(0) +
                                "°",
                            widget.openWeatherModel.weatherList![index].main!
                                    .tempMin
                                    .toStringAsFixed(0) +
                                "°",
                            ((widget.openWeatherModel.weatherList![index].main!
                                    .tempMin) /
                                (widget.openWeatherModel.weatherList![index]
                                    .main!.tempMax)));
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
                      customText(
                          DateTime.parse(widget.openWeatherModel.city!.sunrise
                                  .toString())
                              .toLocal()
                              .format('h:m a'),
                          AppColor.textColor,
                          15,
                          FontWeight.normal,
                          "Poppins-RegularPoppins-Regular"),
                      customText(
                          DateTime.parse(widget.openWeatherModel.city!.sunset
                                  .toString())
                              .toLocal()
                              .format('h:m a'),
                          AppColor.textColor,
                          15,
                          FontWeight.normal,
                          "Poppins-RegularPoppins-Regular")
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
