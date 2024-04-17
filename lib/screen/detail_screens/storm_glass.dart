import 'package:flutter/material.dart';
import 'package:weather/constant/colors.dart';
import 'package:weather/constant/iconpath.dart';
import 'package:weather/model/storm_glass_model.dart';
import 'package:weather/widget/custom_icon.dart';
import 'package:weather/widget/custom_text.dart';
import 'package:weather/widget/nextday_detail_container.dart';
import 'package:date_time_format/date_time_format.dart';

class StormGlassScreen extends StatefulWidget {
  StormGlassModel stormGlassModel = StormGlassModel();
  String address = 'Lahore';
  double height;
  double width;

  StormGlassScreen(
      {Key? key,
        required this.height,
        required this.width,
        required this.address,
        required this.stormGlassModel})
      : super(key: key);

  @override
  _StormGlassScreenState createState() =>
      _StormGlassScreenState();
}

class _StormGlassScreenState
    extends State<StormGlassScreen> {
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
                            // Container(
                            //     height: 150.0,
                            //     width: 150.0,
                            //     child: Image.asset(
                            //       "assets/visual_cross_icons/${widget.visualCrossingModel.currentConditions!.icon.toString()}.png",
                            //       height: 150,
                            //       width: 150,
                            //       fit: BoxFit.fill,
                            //     )),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                customText(
                                    widget.stormGlassModel.hours![0].airTemperature!.noaa!
                                        .toStringAsFixed(0) +
                                        '°',
                                    AppColor.headingTextColor,
                                    30,
                                    FontWeight.bold,
                                    "Poppins-Regular"),
                                const SizedBox(
                                  height: 10,
                                ),
                                // customText(
                                //     widget.visualCrossingModel
                                //         .currentConditions!.conditions
                                //         .toString(),
                                //     AppColor.textColor,
                                //     25,
                                //     FontWeight.bold,
                                //     "Poppins-Regular")
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
                                    icon: IconPath.drop,
                                    color: AppColor.iconColor,
                                    size: 20),
                                customText(
                                    widget.stormGlassModel.hours![0].humidity!.noaa!
                                        .toStringAsFixed(0) +
                                        "%",
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
                                    widget.stormGlassModel.hours![0].visibility!.sg!
                                        .toStringAsFixed(0) +
                                        "km",
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
                                    widget.stormGlassModel.hours![0].windSpeed!.noaa!
                                        .toStringAsFixed(0) +
                                        " m/h",
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
                  customText(
                      "Today's Weather Details",
                      AppColor.headingTextColor,
                      20,
                      FontWeight.bold,
                      "Poppins-Regular"),
                  const Divider(
                    color: Colors.white,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                ],
              ),
              // Container(
              //   height: widget.height * 0.15,
              //   padding: const EdgeInsets.all(5),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       color: AppColor.primaryColor),
              //   child: ListView.builder(
              //       itemCount:
              //       widget.visualCrossingModel.days![0].hours!.length,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (BuildContext context, int index) {
              //         return nextHour(
              //             widget.visualCrossingModel.days![0].hours![index]
              //                 .datetime
              //                 .toString(),
              //             Image.asset(
              //                 "assets/visual_cross_icons/${widget.visualCrossingModel.days![0].hours![index].icon!.toString()}.png"),
              //             widget.visualCrossingModel.days![0].hours![index]
              //                 .temp!
              //                 .toStringAsFixed(0) +
              //                 "°C",
              //             widget.height * 0.15,
              //             widget.width * 0.2);
              //       }),
              // ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customText(
                          "Next 15-Days Forecast",
                          AppColor.headingTextColor,
                          20,
                          FontWeight.bold,
                          "Poppins-Regular"),
                      // customText(
                      //     DateTime.parse(widget
                      //         .simpleWeatherApi.current!.lastUpdated
                      //         .toString())
                      //         .format('l h:00 a'),
                      //     AppColor.textColor,
                      //     18,
                      //     FontWeight.bold,
                      //     "Poppins-RegularPoppins-Regular"),
                    ],
                  ),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.stormGlassModel.hours!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return nextDayDetail(
                            widget.height,
                            widget.width,
                            Image.asset(
                                "assets/icons/thermometer.png"),
                            DateTime.parse(widget
                                .stormGlassModel.hours![index].time
                                .toString())
                                .format("l"),
                            widget.stormGlassModel.hours![index].airTemperature!.noaa!
                                .toStringAsFixed(0) +
                                "°",
                            widget.stormGlassModel.hours![index].airTemperature!.sg!
                                .toStringAsFixed(0) +
                                "°",
                            0.3);
                      }),
                ],
              ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.stretch,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       width: widget.width,
              //       child: Lottie.asset(AnimationPath.sunRiseSunSet),
              //     ),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         customText(
              //             DateFormat.jm().format(DateFormat('h:m').parse(widget
              //                 .visualCrossingModel.currentConditions!.sunrise
              //                 .toString())),
              //             AppColor.textColor,
              //             15,
              //             FontWeight.normal,
              //             "Poppins-RegularPoppins-Regular"),
              //         customText(
              //             DateFormat.jm().format(DateFormat('h:m').parse(widget
              //                 .visualCrossingModel.currentConditions!.sunset
              //                 .toString())),
              //             AppColor.textColor,
              //             15,
              //             FontWeight.normal,
              //             "Poppins-RegularPoppins-Regular")
              //       ],
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
