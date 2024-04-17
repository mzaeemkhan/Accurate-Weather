import 'package:flutter/cupertino.dart';

Widget customImage(String path, double height, double width) {
  return Image.asset(
    path,
    height: height,
    width: width,
    fit: BoxFit.fill,
  );
}
