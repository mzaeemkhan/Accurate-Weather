import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/constant/colors.dart';
import 'package:weather/constant/iconpath.dart';

import 'custom_text.dart';

class NextDay extends StatelessWidget {
  double height;
  double width;
  Color color;
  String station;
  String condition;
  String path;
  String temp;
  String iconPathOne;
  String iconPathTwo;
  String windSpeed;
  String titleOne;
  String titleTwo;
  String visibility;
  String unit1;
  String unit2;

  NextDay(
      {Key? key,
      required this.height,
      required this.width,
      required this.color,
      required this.station,
      required this.condition,
      required this.path,
      required this.temp,
      required this.windSpeed,
      required this.iconPathOne,
      required this.iconPathTwo,
      required this.titleOne,
      required this.titleTwo,
      required this.visibility,
      required this.unit1,
      required this.unit2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 3,
      width: width / 2.3,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColor.secondaryColor,
          borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                customText(station, AppColor.textColor, 10, FontWeight.bold,
                    "Poppins-Regular"),
                customText(condition, AppColor.textColor, 20, FontWeight.bold,
                    "Poppins-Regular"),
                const SizedBox(height: 10,)
              ],
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100.0,
                    child: Lottie.asset(path),
                  ),
                ],
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                customText(temp, AppColor.headingTextColor, 20, FontWeight.bold,
                    "Poppins-Regular"),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    customText(titleOne, AppColor.textColor, 8, FontWeight.bold,
                        "Poppins-Regular"),
                    const SizedBox(
                      width: 30,
                    ),
                    customText(titleTwo, AppColor.textColor, 8, FontWeight.bold,
                        "Poppins-Regular"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            height: 15,
                            child: Image.asset(
                              iconPathOne,
                              color: Colors.white,
                            )),
                        customText(windSpeed, AppColor.textColor, 15,
                            FontWeight.normal, "Poppins-Regular"),
                        customText(unit1, AppColor.textColor, 10,
                            FontWeight.normal, "Poppins-Regular"),
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                            height: 15,
                            child: Image.asset(
                              iconPathTwo,
                              color: Colors.white,
                            )),
                        customText(visibility, AppColor.textColor, 15,
                            FontWeight.normal, "Poppins-Regular"),
                        customText(unit2, AppColor.textColor, 10,
                            FontWeight.normal, "Poppins-Regular"),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
