import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/api_requests/api_get_requests.dart';
import 'package:weather/api_requests/api_path.dart';

Widget defaultTextField(TextEditingController callback, String title) {
  return TextFormField(
    inputFormatters: [
      FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s"))
    ],
    controller: callback,
    decoration: InputDecoration(
        hintText: title,
        fillColor: Colors.transparent,
    ),
    keyboardType: TextInputType.name,
    validator: (value) {
      if (value == null) {
        return "Field can not be left empty";
      } else if (value.isEmpty) {
        return "Field can not be left empty";
      } else {
        return null;
      }
    },
  );
}