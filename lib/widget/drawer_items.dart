import 'package:flutter/cupertino.dart';
import 'package:weather/constant/colors.dart';

import 'custom_text.dart';

Widget drawerItems(Widget icon, String location, String temperature) {
  return Container(
    height: 100,
    margin: const EdgeInsets.only(top: 5),
    decoration:
        BoxDecoration(color: AppColor.secondaryColor, borderRadius: BorderRadius.circular(20)),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
           flex:1,
            child: icon,
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customText(location, AppColor.textColor, 20, FontWeight.bold, "Poppins-Regular"),
                customText(temperature + "°C", AppColor.headingTextColor, 20, FontWeight.bold,
                    "Poppins-Regular"),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
