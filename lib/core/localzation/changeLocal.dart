import 'dart:ui';

import 'package:ecommerce/core/constant/AppTheme.dart';
import 'package:ecommerce/core/function/fcmconfig.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController{

  Locale? language;
  ThemeData appTheme=themeArabic;
  MyServices myServices=Get.find();
  void changeLanguage(String langCode){
    Locale local =Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    appTheme=langCode=="en"?themeEnglish:themeArabic;
    Get.changeTheme(appTheme);
    Get.updateLocale(local);
  }

  requestPermissionLocation()async{
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("Warning!", "Allow to Access to your Location");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("Warning!", 'Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("Warning!", 'Location permissions are permanently denied, we cannot request permissions.');

    }
  }

  @override
  void onInit() {
    requestPermissionNotification();
    fcmConfig();
    requestPermissionLocation();
   String? sharedPrefLang= myServices.sharedPreferences.getString("lang");
    if(sharedPrefLang=="ar") {
      language= const Locale("ar");
      appTheme=themeArabic;
    }else if(sharedPrefLang=="en")
      {language= const Locale("en");
      appTheme=themeEnglish;
      }
    else{
      language=Locale(Get.deviceLocale!.languageCode);
      if(Get.deviceLocale!.languageCode=="en"){
        appTheme=themeEnglish;
      }

    }
    super.onInit();
  }
}