import 'package:ecommerce/controller/homePageController.dart';
import 'package:ecommerce/core/function/translateData.dart';
import 'package:ecommerce/data/model/itemsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../linkApi.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomListItemsHome extends GetView<HomePageControllerImp> {
  const CustomListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.items.length,
            itemBuilder: (BuildContext context, int index) {
              return Items(
                itemsModel: ItemsModel.fromJson(controller.items[index]),
              );
            }));
  }
}

class Items extends GetView<HomePageControllerImp> {
  final ItemsModel itemsModel;

  const Items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          child: CachedNetworkImage(
            height: 100,
            width: 150,
            fit: BoxFit.fill, imageUrl: "${AppApiLink.imagesItems}/${itemsModel.itemsImage}",
          ),
        ),
        Container(
          height: 120,
          width: 200,
          decoration: BoxDecoration(
              color: AppColor.blue900.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20)),
        ),
        Positioned(
            top: 5.0,
            left: controller.lang=="en"? 16.0:null,
            right: controller.lang=="ar"? 16.0:null,
            child: Text(
              "${translateData(itemsModel.itemsNameAr, itemsModel.itemsName)}",
              style: const TextStyle(
                  color: AppColor.white, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
