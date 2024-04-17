import 'package:flutter/cupertino.dart';

Widget customText(
    text, Color color, double size, FontWeight fontWeight, String fonfamily) {
  return Text(
    text ?? "Failed",
    style: TextStyle(
        color: color,
        fontSize: size,
        decoration: TextDecoration.none,
        fontWeight: fontWeight,
        fontFamily: fonfamily),
    textAlign: TextAlign.center,
    maxLines: 2,
  );
}
