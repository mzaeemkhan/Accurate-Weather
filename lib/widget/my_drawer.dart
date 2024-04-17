import 'dart:convert';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/api_requests/api_get_requests.dart';
import 'package:weather/api_requests/api_path.dart';
import 'package:weather/constant/colors.dart';
import 'package:weather/constant/iconpath.dart';
import 'package:weather/model/open_weather_model.dart';
import 'package:weather/functions/response_decoder.dart';
import 'package:weather/screen/detail_screens/openweather.dart';
import 'custom_icon.dart';
import 'custom_text.dart';
import 'drawer_items.dart';
import 'input_validator.dart';

class MyDrawer extends StatefulWidget {
  double height;
  double width;
   MyDrawer({Key? key,required this.height,required this.width}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  late List<OpenWeatherModel> drawerListItems = [];

  TextEditingController addCity = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future getDrawer() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var data = preferences.getString("drawer");
    drawerListItems =
    List<OpenWeatherModel>.from(json.decode(data!).map((x) => OpenWeatherModel.fromJson(x)));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColor.primaryColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             FutureBuilder(
               future: getDrawer(),
               builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
               return  ListView.builder(
                   physics: const NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount:drawerListItems.length,
                   itemBuilder: (BuildContext context, int index) {
                     return InkWell(
                         onLongPress: () async {
                           showDialog(
                               barrierColor: AppColor.primaryColor.withOpacity(0.5),
                               context: context,
                               builder: (BuildContext ctx) {
                                 return AlertDialog(
                                   backgroundColor: AppColor.secondaryColor,
                                   title: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       CustomIcon(
                                         icon: IconPath.warning,
                                         color: AppColor.iconColor,
                                         size: 30,
                                       ),
                                       customText(
                                           "Are you sure to remove!",
                                           AppColor.headingTextColor,
                                           15,
                                           FontWeight.normal,
                                           "Poppins-Regular"),
                                     ],
                                   ),
                                   actions: [
                                     InkWell(
                                       onTap: () async {
                                         Navigator.pop(ctx);
                                       },
                                       child: Padding(
                                         padding: const EdgeInsets.all(20),
                                         child: customText(
                                             "Cancel",
                                             AppColor.headingTextColor,
                                             15,
                                             FontWeight.normal,
                                             "Poppins-Regular"),
                                       ),
                                     ),
                                     InkWell(
                                       onTap: () async {
                                         setState(() {
                                           drawerListItems.removeAt(index);
                                         });
                                         SharedPreferences preference =
                                         await SharedPreferences.getInstance();
                                         preference.setString(
                                             "drawer", json.encode(drawerListItems));
                                         Navigator.pop(ctx);
                                       },
                                       child: Padding(
                                         padding: const EdgeInsets.all(20),
                                         child: customText("Ok", AppColor.headingTextColor,
                                             15, FontWeight.normal, "Poppins-Regular"),
                                       ),
                                     ),
                                   ],
                                 );
                               });
                         },
                         onTap: () {
                           Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) => OpenWeatherDetailScreen(
                                     height:widget. height,
                                     width:widget. width,
                                     openWeatherModel:drawerListItems[index],
                                     address:drawerListItems[index].city!.name.toString(),
                                   )));
                         },
                         child: drawerItems(
                             Image.asset(
                                 "assets/open_weather_icons/${drawerListItems[index].weatherList![0].weather![0].icon}.png"),
                             drawerListItems[index].city!.name.toString(),
                             drawerListItems[index].weatherList![0].main!.temp.toStringAsFixed(0)));
                   });
             },),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 5,
                      shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      primary: AppColor.headingTextColor),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext ctx) {
                          return AlertDialog(
                            backgroundColor: AppColor.headingTextColor,
                            title: Column(
                              children: [
                                customText("Enter Location", AppColor.textColor, 20,
                                    FontWeight.normal, "Poppins-Regular"),
                                const Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                  indent: 20,
                                  endIndent: 20,
                                ),
                              ],
                            ),
                            content: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Form(
                                key: formKey,
                                child: defaultTextField(addCity, 'Location'),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(
                                  ctx,
                                ),
                                child: customText("Cancel", AppColor.textColor, 15,
                                    FontWeight.normal, "Poppins-Regular"),
                              ),
                              TextButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    String url = ApiPaths.openWeatherBaseUrl+addCity.text+ApiPaths.openWeatherKey;
                                    ApiRequest apiRequest = ApiRequest(url: url);
                                    apiRequest.get().then((value) {
                                      if (value.statusCode == 200) {
                                        getOpenWeather(addCity.text).then((value) async {
                                          setState(() {
                                         addCity.clear();
                                            Navigator.pop(ctx);
                                        drawerListItems.add(value);
                                          });
                                          SharedPreferences preference = await SharedPreferences.getInstance();
                                          await preference.setString("drawer", json.encode(drawerListItems));
                                        });
                                      } else {
                                       addCity.clear();
                                        Navigator.pop(ctx);
                                        Flushbar(
                                          message: "City not Found!",
                                          duration: const Duration(seconds: 3),
                                        ).show(ctx);
                                      }
                                    });
                                  }
                                },
                                child: customText("Ok",AppColor.textColor, 15,FontWeight.normal,"Poppins-Regular"),
                              ),
                            ],
                          );
                        });
                  },
                  child: customText("Add Location", AppColor.textColor, 15,
                      FontWeight.normal, "Poppins-Regular"))
            ],
          ),
        ),
      ),
    );
  }
}
