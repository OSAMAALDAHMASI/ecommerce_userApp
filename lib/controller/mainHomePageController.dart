import 'package:ecommerce/view/screen/homePage.dart';
import 'package:ecommerce/view/screen/notification.dart';
import 'package:ecommerce/view/screen/offers.dart';
import 'package:ecommerce/view/screen/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MainHomePageController extends GetxController {
  changePage(int index);
}

class MainHomePageControllerImp extends MainHomePageController {
  int currentPage = 0;

  List<Widget> listPage = [
    const HomePage(),
    const NotificationPage(),
    const Offers(),
    const SettingPage(),
  ];
List<Map<String,dynamic>> listButtonAppBar=[
  {
    "name":"Home",
    "icon":Icons.home_outlined,
  },
  {
    "name":"Notification",
    "icon":Icons.notifications_active_outlined,
  },
  {
    "name":"Profile",
    "icon":Icons.person_outline,
  },
  {
    "name":"Settings",
    "icon":Icons.settings_outlined,
  },
];




  @override
  changePage(int index) {
    currentPage = index;
    update();
  }
}
