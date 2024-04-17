import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/constant/colors.dart';
import 'package:weather/screen/home_screen.dart';
import 'package:weather/screen/privacy_policy.dart';
import 'package:weather/widget/custom_image.dart';
import 'package:weather/widget/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      Timer(const Duration(seconds: 3), () {
        checkScreen();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: AppColor.secondaryColor,
                  height: size.height / 3,
                  width: size.width / 2,
                  child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Lottie.asset('assets/animations/02d.json')),
                ),
                customText("Weather App", AppColor.headingTextColor, 30,
                    FontWeight.normal, "Poppins-Regular"),
              ],
            ),
          ),
          Expanded(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customImage('assets/logo/atrule.png', 50.0, 50.0),
                    const SizedBox(
                      width: 10.0,
                    ),
                    customText("ATRULE TECHNOLOGIES", AppColor.headingTextColor,
                        12, FontWeight.normal, "Poppins-Regular"),
                  ],
                ),
              ))
        ],
      )),
    );
  }
checkScreen() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
   bool? check =  preferences.getBool("Agree");
   if(check == true) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }else{
     Navigator.pushReplacement(
         context, MaterialPageRoute(builder: (context) => const PrivacyPolicy()));
   }
  }
}
