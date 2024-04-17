import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:weather/constant/colors.dart';

import 'custom_text.dart';

Widget nextDayDetail(double height, double width, Widget icon, String day,
    String highTM, String lowTM, double percent) {
  return Container(
      child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        width: width * 0.2,
        child: customText(
            day, AppColor.textColor, 10, FontWeight.bold, "Poppins-Regular"),
      ),
      Container(
        width: width * 0.3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 20,
              width: 3,
              color: AppColor.headingTextColor,
            ),
            Container(
              height: height * 0.05,
              width: width * 0.2,
              child: icon,
            ),
            Container(
              height: 20,
              width: 3,
              color: AppColor.headingTextColor,
            ),
          ],
        ),
      ),
      Container(
        width: width * 0.3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customText(lowTM, AppColor.textColor, 10, FontWeight.normal,
                "Poppins-Regular"),
            LinearPercentIndicator(
              backgroundColor: AppColor.headingTextColor,
              width: 50.0,
              lineHeight: 8.0,
              percent: percent,
              progressColor: AppColor.progressColor,
            ),
            customText(highTM, AppColor.textColor, 10, FontWeight.bold,
                "Poppins-Regular"),
          ],
        ),
      )
    ],
  ));
}
