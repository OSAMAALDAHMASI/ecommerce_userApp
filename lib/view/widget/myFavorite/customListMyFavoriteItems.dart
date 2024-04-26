import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/myFovariteController.dart';
import 'package:ecommerce/core/function/translateData.dart';
import 'package:ecommerce/data/model/myFovriteModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../linkApi.dart';

class CustomListMyFavoriteItems extends GetView<MyFavoriteController> {
  final MyFavoriteModel myFavoriteModel;

  const CustomListMyFavoriteItems({
    super.key,
    required this.myFavoriteModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToItemsDetailsPage(itemsModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FittedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: '${myFavoriteModel.itemsImage} ',
                  child: CachedNetworkImage(
                    height: MediaQuery.of(context).size.width / 4.5,
                    fit: BoxFit.fill,
                    imageUrl:
                    "${AppApiLink.imagesItems}/${myFavoriteModel.itemsImage}",
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width / 40),
                Text(
                  "${translateData(myFavoriteModel.itemsNameAr, myFavoriteModel.itemsName)}",
                  style: const TextStyle(
                      color: AppColor.blue900,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: MediaQuery.of(context).size.width / 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Rating",
                      textAlign: TextAlign.start,
                    ),
                    Row(
                      children: [
                        ...List.generate(
                            5,
                                (index) => const Icon(
                              Icons.star,
                              size: 15,
                              color: AppColor.amber,
                            ))
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${myFavoriteModel.itemsPrice}\$",
                      style: const TextStyle(
                          color: AppColor.red,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 20,),

                    IconButton(
                        onPressed: () {
                          controller.deleteData(myFavoriteModel.favoriteId);
                        },
                        icon: const Icon(
                            Icons.delete_outline,
                            color: AppColor.red))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
