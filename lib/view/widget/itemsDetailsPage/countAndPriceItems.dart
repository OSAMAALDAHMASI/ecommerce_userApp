import 'package:ecommerce/controller/itemsDetailsPageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';

class CountAndPrice extends GetView<ItemsDetailsPageControllerImp> {
  final void Function()? onPressedAdd;
  final void Function()? onPressedDelete;
  // final String itemsCount;
  const CountAndPrice( { super.key,required this.onPressedAdd,required this.onPressedDelete,});

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: onPressedAdd,
                icon: const Icon(Icons.add_outlined)),
             GetBuilder<ItemsDetailsPageControllerImp>(builder: (x)=>Text(
               "${controller.itemsCount}",
               style: TextStyle(fontSize: 24),
             )),
            IconButton(
                onPressed: onPressedDelete,
                icon: const Icon(Icons.remove_outlined)),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            Text(
              "${controller.itemsModel.itemsPrice}\$",
              style:  TextStyle(
                  decoration:controller.itemsModel.itemsPrice!=controller.itemsModel.itemsPriceDiscount? TextDecoration.lineThrough:null,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: controller.itemsModel.itemsPrice!=controller.itemsModel.itemsPriceDiscount? AppColor.blue900:AppColor.red),
            ),const SizedBox(width: 20,),
            controller.itemsModel.itemsPrice!=controller.itemsModel.itemsPriceDiscount?Text(
              "${controller.itemsModel.itemsPriceDiscount}\$",
              style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: AppColor.red),
            ):const SizedBox()
          ],
        )
      ],
    );
  }
}
