import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/localzation/changeLocal.dart';
import '../widget/language/customButtonLan.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("1".tr,style: Theme.of(context).textTheme.displayLarge,),
            SizedBox(height: MediaQuery.of(context).size.width *0.1,),
              CustomButtonLang(textButton: "English",onPressed: (){
                controller.changeLanguage("en");
                Get.toNamed(AppRoute.onBoarding);
              }),
              CustomButtonLang(textButton: "العربية",onPressed: (){
                controller.changeLanguage("ar");
                Get.toNamed(AppRoute.onBoarding);
              }),

                    ],),
          ),
        ),
      ),
    );
  }
}
