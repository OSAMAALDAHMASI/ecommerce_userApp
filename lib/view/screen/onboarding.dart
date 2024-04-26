import 'package:ecommerce/controller/onBoardingController.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../widget/onBoarding/customButton.dart';
import '../widget/onBoarding/customslider.dart';
import '../widget/onBoarding/dotController.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(OnBoardingControllerImp());
    return  Scaffold(
      backgroundColor: AppColor.white,
        body: SafeArea(

      child: Column(
        children: [
          Container(

              margin: EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  DropdownButton<String>(
                    value: "English",
                    onChanged: (v){}, items: ["English","عربي"].map((e) => DropdownMenuItem(
                    value:e ,
                    child: Text(e),
                  )).toList(),

                  ),
                ],
              )),
          Expanded(
            flex: 6,
            child: CustomSliderOnBoarding(),
          ),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Spacer(),
                   CustomDotControllerOnBoarding(),
                  Spacer(),
                  CustomButtonOnBoarding()
                ],
              ))
        ],
      ),
    ));
  }
}


//
// import 'package:ecommerce/controller/onBoardingController.dart';
// import 'package:ecommerce/core/constant/color.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import '../../data/datasource/static/static.dart';
// import '../widget/onBoarding/customButton.dart';
// import '../widget/onBoarding/customslider.dart';
// import '../widget/onBoarding/dotController.dart';
//
// class OnBoarding extends StatelessWidget {
//   const OnBoarding({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     OnBoardingControllerImp controller=  Get.put(OnBoardingControllerImp());
//     return  Scaffold(
//         backgroundColor: AppColor.white,
//         body: SafeArea(
//
//           child: Column(
//             children: [
//               Container(
//
//                   margin: EdgeInsets.only(top: 16.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//
//                       DropdownButton<String>(
//                         value: "English",
//                         onChanged: (v){}, items: ["English","عربي"].map((e) => DropdownMenuItem(
//                         value:e ,
//                         child: Text(e),
//                       )).toList(),
//
//                       ),
//                     ],
//                   )),
//               PageView.builder(
//                 controller: controller.pageController,
//                 onPageChanged: (val) {
//                   print(val);
//                   controller.onPageChange(val);
//                 },
//                 itemCount: onBoardingList.length,
//                 itemBuilder: (BuildContext context, int i) {
//                   return Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset("${onBoardingList[i].image}",height: 350,width: 250,),
//
//                       FittedBox(
//                         child: Text(
//                           "${onBoardingList[i].title}",
//                           style: TextStyle(color: AppColor.blue900,fontSize:screenWidth*0.08,fontWeight: FontWeight.bold ),
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           ...List.generate(
//                               onBoardingList.length,
//                                   (index) => GetBuilder<OnBoardingControllerImp>(
//                                   builder: (controller) => AnimatedContainer(
//                                     margin: const EdgeInsets.only(right: 5),
//                                     duration: const Duration(milliseconds: 900),
//                                     width: controller.currentPage == index ? 20 : 5,
//                                     height: 6,
//                                     decoration: BoxDecoration(
//                                         color: AppColor.primaryColor,
//                                         borderRadius: BorderRadius.circular(10)),
//                                   )))
//                         ],
//                       ),
//                       FittedBox(
//                         child: Text(
//                           "${onBoardingList[i].body}",
//                           style:  TextStyle(color: AppColor.blue800,fontSize:screenWidth*0.0470,),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//
//                     ],
//                   );
//                 },
//               ),
//               Column(
//                 children: [
//
//                   Container(margin: const EdgeInsets.only(bottom: 30),height: 40,
//                     child: MaterialButton(
//                       padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 0),
//                       textColor: Colors.white,
//                       onPressed: () {
//                         controller.next();
//                       },color: AppColor.primaryColor,
//                       child:  Text("8".tr),
//                     ),
//
//                   )
//                 ],
//               )
//             ],
//           ),
//         ));
//   }
// }
