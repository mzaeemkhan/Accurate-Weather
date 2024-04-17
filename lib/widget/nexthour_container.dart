import 'package:flutter/cupertino.dart';
import 'package:weather/constant/colors.dart';

import 'custom_icon.dart';
import 'custom_text.dart';

Widget nextHour(String hour, Widget image, String temperature, double height,
    double width) {
  return Container(
    height: height,
    width: width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText(
            hour, AppColor.textColor, 10, FontWeight.bold, "Poppins-Regular"),
        image,
        customText(
            temperature, AppColor.textColor, 15, FontWeight.normal, "Roboto")
      ],
    ),
  );
}
