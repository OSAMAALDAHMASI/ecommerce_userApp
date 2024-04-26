import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/datasource/static/static.dart';

abstract class OnBoardingController extends GetxController{
  next();
  onPageChange(int index);
  
}

class OnBoardingControllerImp extends OnBoardingController{
  int currentPage=0;
  MyServices myServices =Get.find();
  late PageController  pageController;
  @override
  next() {
    currentPage++;
   if(currentPage>onBoardingList.length-1){
     myServices.sharedPreferences.setString("step", "1");
     Get.offAllNamed(AppRoute.login);
   }else{
     pageController.animateToPage(currentPage, duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
   }
  }

  @override
  onPageChange(int index) {
    currentPage=index;
    update();
  }
  
  @override
  void onInit() {
    pageController =PageController();
    super.onInit();
  }
  
}