import 'package:ecommerce/controller/homePageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';

class CustomCardHome extends GetView<HomePageControllerImp> {
  final String textTitle;
  final String textBody;
  const CustomCardHome({super.key, required this.textTitle, required this.textBody});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 150,
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(20)),
            child:  ListTile(
              title: Text(
                textTitle
               ,
                style: const TextStyle(
                    fontSize: 20, color: Colors.white),
              ),
              subtitle: Text(textBody
               ,
                style: const TextStyle(
                    fontSize: 30, color: Colors.white),
              ),
            ),
          ),
          Positioned(
            top: -20,
            right: controller.lang=="en"?-20:null,
            left: controller.lang=="ar"?-20:null,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: AppColor.blue800,
                  borderRadius: BorderRadius.circular(100)),
            ),
          )
        ],
      ),
    );
  }
}
