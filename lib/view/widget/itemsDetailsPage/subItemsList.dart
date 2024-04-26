import 'package:ecommerce/controller/itemsDetailsPageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';

class SubItemsList extends GetView<ItemsDetailsPageControllerImp> {
  const SubItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(controller.subItems.length, (index) => Container(
            margin: const EdgeInsets.only(right: 10.0),
            alignment: Alignment.center,
            height: 60,
            width: 90,
            decoration: BoxDecoration(
                color:controller.subItems[index]['active']=='1'? AppColor.primaryColor:AppColor.white,
                border: Border.all(color: AppColor.primaryColor),
                borderRadius: BorderRadius.circular(10.0)),
            child:  Text(
              "${controller.subItems[index]['name']}",
              style: TextStyle(
                  color:controller.subItems[index]['active']=='1'? AppColor.white:AppColor.primaryColor, fontWeight: FontWeight.bold),
            )))
      ],
    );
  }
}
