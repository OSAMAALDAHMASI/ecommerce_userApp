import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/cartController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomCardCart extends GetView<CartControllerImp> {
  final String imageUrl;
  final String itemsName;
  final String itemsPrice;
  final String itemsPriceWithDiscount;
  final String countItems;
 final void Function()? addFunction;
 final void Function()? deleteFunction;
  const CustomCardCart(  {super.key, required this.imageUrl,required this.itemsPriceWithDiscount, required this.itemsName, required this.itemsPrice, required this.countItems,required this.addFunction,required this.deleteFunction,});
  // Image.asset('assets/images/laptop.png', fit: BoxFit.cover,)
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(builder: (controller)=>Card(child: Row(children: [
      Expanded(
          flex: 2,
          child: CachedNetworkImage(imageUrl:imageUrl)),
      Expanded(
          flex: 3,
          child: ListTile(title: Text(itemsName),
            subtitle:itemsPriceWithDiscount!=itemsPrice?Row(children: [Text("$itemsPrice\$",style: const TextStyle(decoration: TextDecoration.lineThrough,color: AppColor.blue900,fontSize: 17.0),),
            const SizedBox(width: 12.0,),  Text("$itemsPriceWithDiscount\$",style: const TextStyle(color: AppColor.red,fontSize: 17.0),),],) :Text("$itemsPrice\$",style: const TextStyle(color: AppColor.red,fontSize: 17.0),),
          )),
      Expanded(child: Column(children: [
        IconButton(onPressed: addFunction, icon: const Icon(Icons.add)),
        Text(
          countItems,
          style: const TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        IconButton(onPressed: deleteFunction, icon: const Icon(Icons.remove))

      ],)),
    ],),));
  }
}
