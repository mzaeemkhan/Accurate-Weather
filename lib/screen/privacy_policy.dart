import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/constant/colors.dart';
import 'package:weather/constant/iconpath.dart';
import 'package:weather/constant/string_assets.dart';
import 'package:weather/screen/home_screen.dart';
import 'package:weather/widget/custom_icon.dart';
import 'package:weather/widget/custom_image.dart';
import 'package:weather/widget/custom_text.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  bool isChecked = false;
  bool dialogCheck=true;
  @override
  initState() {
    super.initState();
    Future.delayed(Duration.zero, () => _showMyDialog(context));
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
          child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20,),
                    customText("Terms and Services", AppColor.headingTextColor, 20, FontWeight.bold, "Poppins-Regular"),
                    const SizedBox(height: 10,),
                    customImage('assets/images/logo.png', 100, 100),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(StringAssets.termServices,
                          style: const TextStyle(
                              fontSize: 13,
                              fontFamily: "Poppins-Regular",
                              color: AppColor.textColor,
                              decoration: TextDecoration.none,
                              wordSpacing: 0.05),
                          textAlign: TextAlign.justify),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Theme( // For Color Change,
                                  data: ThemeData(unselectedWidgetColor: AppColor.headingTextColor),
                                  child: Checkbox(
                                    value: isChecked,
                                    shape: RoundedRectangleBorder( // Making around shape
                                        borderRadius: BorderRadius.circular(5)),
                                    onChanged: ( value) {
                                      setState(() {
                                        isChecked=value!;
                                      });
                                    },
                                    activeColor: AppColor.primaryColor,
                                  ),
                                ),
                                const SizedBox(width: 5,),
                                customText("I Agree", AppColor.textColor, 15, FontWeight.bold, "Poppins-Regular")
                              ],
                            ),
                          ),
                        ]),
                    const SizedBox(height: 10,),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        decoration:  const BoxDecoration(
                          color: AppColor.headingTextColor,
                        ),
                        child: TextButton(onPressed: () async {
                          if(isChecked){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
                            SharedPreferences preference=await SharedPreferences.getInstance();
                            preference.setBool("Agree", isChecked);
                          }else{
                            const snackBar = SnackBar(
                                duration: Duration(milliseconds: 1000),
                                content: Text('Please Agree with our terms and services!'));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        },
                          child: customText("Agree and Continue", AppColor.textColor, 13,FontWeight.bold, "Poppins-Regular"),
                        )
                    )
                  ],
                ),
              ),
      ),
    );
  }
  Future _showMyDialog(context) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:Colors.transparent,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  color: AppColor.headingTextColor,
                  height:50,
                  child: Center(
                    child:  CustomIcon(
                      icon: IconPath.attention,
                      color: AppColor.iconColor,
                      size: 80,
                    ),
                  )),
              Container(
                color: AppColor.textColor,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    customText("Weather", AppColor.headingTextColor, 20, FontWeight.bold, "Poppins-Regular"),
                    const SizedBox(height: 10),
                    const Text("Weather app requires your background location through GPS for showing the current weather at your location", style: TextStyle(color:AppColor.headingTextColor,fontSize: 15,fontWeight: FontWeight.normal,fontFamily: "Poppins-Regular"),textAlign:TextAlign.center,),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context, false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          height: 40,
                          child: Center(
                            child: customText(
                                "Ok", AppColor.headingTextColor, 18, FontWeight.normal, "Poppins-Regular"),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
