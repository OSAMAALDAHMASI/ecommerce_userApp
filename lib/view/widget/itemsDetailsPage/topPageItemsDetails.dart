import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/itemsDetailsPageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../linkApi.dart';

class TopItemsPageDetails extends GetView<ItemsDetailsPageControllerImp> {
  const TopItemsPageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: const BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius:
              BorderRadius.vertical(bottom: Radius.circular(15.0))),
          height: 180,
        ),
        Positioned(
            top: 30.0,
            left: Get.width / 8,
            right: Get.width / 8,
            child: Hero(
              tag: "${controller.itemsModel.itemsImage}",
              child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  height: 250,
                  imageUrl:
                  "${AppApiLink.imagesItems}/${controller.itemsModel.itemsImage}"),
            ))
      ],
    );
  }
}
