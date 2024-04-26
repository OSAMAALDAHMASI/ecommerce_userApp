import 'dart:ui';

import 'package:ecommerce/controller/homePageController.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

abstract class SettingController extends GetxController{
  logOut();
  changeLang();
  goToAddressPage();
  goToPendingPage();
  goToArchivePage();
}

class SettingControllerImp extends SettingController{

  MyServices myServices =Get.find();
  String? langCode;
HomePageControllerImp homePageControllerImp =Get.find();
  @override
  logOut()async {
  // await  myServices.sharedPreferences.clear();
  String userId= myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$userId");
    myServices.sharedPreferences.setString("step","1") ;
  // await  myServices.sharedPreferences.setString("step", "1");
  Get.offAllNamed(AppRoute.login);
  }

  @override
  changeLang() {
    if(myServices.sharedPreferences.getString("lang")=="en"){
      langCode="ar";
      Locale local = Locale(langCode!);
      Get.updateLocale(local);
      myServices.sharedPreferences.setString("lang", langCode!);
      homePageControllerImp.lang="ar";
    }
    else{
      langCode="en";
      Locale local = Locale(langCode!);
      Get.updateLocale(local);
      myServices.sharedPreferences.setString("lang", langCode!);
      homePageControllerImp.lang="en";
    }
  }

  @override
  goToPendingPage() {
    Get.toNamed(AppRoute.orderPending);
  }

  @override
  goToAddressPage() {
   Get.toNamed(AppRoute.addressPage);
  }

  @override
  goToArchivePage() {
    Get.toNamed(AppRoute.orderArchive);
  }

}