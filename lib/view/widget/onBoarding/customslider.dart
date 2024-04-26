import 'package:ecommerce/controller/onBoardingController.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        print(val);
        controller.onPageChange(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (BuildContext context, int i) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("${onBoardingList[i].image}",height: 350,width: 250,),
            const Spacer(
              flex: 1,
            ),
            FittedBox(
              child: Text(
                "${onBoardingList[i].title}",
                style: TextStyle(color: AppColor.blue900,fontSize:screenWidth*0.08,fontWeight: FontWeight.bold ),
              ),
            ),
            const Spacer(flex: 1),
            FittedBox(
              child: Text(
                "${onBoardingList[i].body}",
                style:  TextStyle(color: AppColor.blue800,fontSize:screenWidth*0.0470,),
                textAlign: TextAlign.center,
              ),
            ),
            // const Spacer(
            //   flex: 3,
            // ),
          ],
        );
      },
    );
  }
}
