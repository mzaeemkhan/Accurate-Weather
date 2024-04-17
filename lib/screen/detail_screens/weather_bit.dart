import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/constant/animation%20path.dart';
import 'package:weather/constant/colors.dart';
import 'package:weather/constant/iconpath.dart';
import 'package:weather/model/bit_weather_model.dart';
import 'package:weather/functions/string_titlecase.dart';
import 'package:weather/widget/custom_icon.dart';
import 'package:weather/widget/custom_text.dart';
import 'package:weather/widget/nextday_detail_container.dart';
import 'package:date_time_format/date_time_format.dart';

class BitWeatherDetailScreen extends StatefulWidget {
  BitWeatherModel bitWeatherModel = BitWeatherModel();
  String address = 'Lahore';
  double height;
  double width;
  BitWeatherDetailScreen(
      {Key? key,
      required this.height,
      required this.width,
      required this.address,
      required this.bitWeatherModel})
      : super(key: key);

  @override
  _BitWeatherDetailScreenState createState() => _BitWeatherDetailScreenState();
}

class _BitWeatherDetailScreenState extends State<BitWeatherDetailScreen> {
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
                                    "assets/biticons/${widget.bitWeatherModel.data![0].weather!.icon}.png")),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                customText(
                                    widget.bitWeatherModel.cityName
                                        .toString()
                                        .toTitleCase,
                                    AppColor.textColor,
                                    20,
                                    FontWeight.bold,
                                    "Poppins-Regular"),
                                customText(
                                    widget.bitWeatherModel.data![0].temp
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
                                    widget.bitWeatherModel.data![0].weather!
                                        .description
                                        .toString()
                                        .toTitleCase,
                                    AppColor.textColor,
                                    20,
                                    FontWeight.bold,
                                    "Poppins-Regular"),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomIcon(
                                        icon: IconPath.thermometer,
                                        color: AppColor.iconColor,
                                        size: 20),
                                    customText(
                                        widget.bitWeatherModel.data![0].pres
                                                .toString() +
                                            " hPa",
                                        AppColor.textColor,
                                        15,
                                        FontWeight.bold,
                                        "Poppins-Regular")
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomIcon(
                                        icon: IconPath.visibility,
                                        color: AppColor.iconColor,
                                        size: 20),
                                    customText(
                                        widget.bitWeatherModel.data![0].vis
                                                .toString() +
                                            " km",
                                        AppColor.textColor,
                                        15,
                                        FontWeight.bold,
                                        "Poppins-Regular")
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomIcon(
                                        icon: IconPath.windSpeed,
                                        color: AppColor.iconColor,
                                        size: 20),
                                    customText(
                                        widget.bitWeatherModel.data![0].windSpd
                                                .toString() +
                                            " m/s",
                                        AppColor.textColor,
                                        15,
                                        FontWeight.bold,
                                        "Poppins-Regular")
                                  ],
                                )
                              ],
                            ),
                            const Divider(
                              color: Colors.white,
                              thickness: 1,
                              indent: 10,
                              endIndent: 10,
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
              Column(
                children: [
                  customText("Weather Forecast", AppColor.headingTextColor, 20,
                      FontWeight.bold, "Poppins-Regular"),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.bitWeatherModel.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return nextDayDetail(
                            widget.height,
                            widget.width,
                            Image.asset(
                                "assets/biticons/${widget.bitWeatherModel.data![index].weather!.icon}.png"),
                            DateTime.parse(widget
                                    .bitWeatherModel.data![index].datetime
                                    .toString())
                                .format("l"),
                            widget.bitWeatherModel.data![index].highTemp
                                    .toStringAsFixed(0) +
                                "°",
                            widget.bitWeatherModel.data![index].lowTemp
                                    .toStringAsFixed(0) +
                                "°",
                            ((widget.bitWeatherModel.data![index].lowTemp)! /
                                (widget.bitWeatherModel.data![index].highTemp!
                                    .toDouble())));
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
                          DateTime.parse(widget
                                  .bitWeatherModel.data![0].sunriseTs
                                  .toString())
                              .toUtc()
                              .format("h:m a"),
                          AppColor.textColor,
                          15,
                          FontWeight.normal,
                          "Poppins-RegularPoppins-Regular"),
                      customText(
                          DateTime.parse(widget
                                  .bitWeatherModel.data![0].sunsetTs
                                  .toString())
                              .toUtc()
                              .format("h:m a"),
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
