import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/favoriteController.dart';
import 'package:ecommerce/controller/itemsPageController.dart';
import 'package:ecommerce/core/function/translateData.dart';
import 'package:ecommerce/data/model/itemsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../linkApi.dart';

class CustomListItems extends GetView<ItemsPageControllerImp> {
  final ItemsModel itemsModel;

  const CustomListItems({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemsDetailsPage(itemsModel);
      },
      child: FittedBox(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: '${itemsModel.itemsImage} ',
                  child: CachedNetworkImage(
                    height: MediaQuery.of(context).size.width / 4.5,
                    fit: BoxFit.fill,
                    imageUrl:
                        "${AppApiLink.imagesItems}/${itemsModel.itemsImage}",
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width / 40),
                Text(
                  "${translateData(itemsModel.itemsNameAr, itemsModel.itemsName)}",
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
                    const SizedBox(width: 18.0,),
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
                    Row(
                      children: [
                        Text(
                          "${itemsModel.itemsPrice}\$",
                          style:  TextStyle(
                            decoration:itemsModel.itemsPrice!=itemsModel.itemsPriceDiscount? TextDecoration.lineThrough:null,
                              color:itemsModel.itemsPrice!=itemsModel.itemsPriceDiscount? AppColor.blue900:AppColor.red,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                           const SizedBox(width: 20,),
                        itemsModel.itemsPrice!=itemsModel.itemsPriceDiscount?Text(
                          "${itemsModel.itemsPriceDiscount}\$",
                          style: const TextStyle(
                              color: AppColor.red,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ):const SizedBox(),
                      ],
                    ),
                    GetBuilder<FavoriteController>(
                        builder: (controller) => IconButton(
                            onPressed: () {
                             if( controller.isFavorite[itemsModel.itemsId] == "0")
                               {
                                 controller.setFavorite(
                                     itemsModel.itemsId!, "1");
                                 controller.addFavorite(itemsModel.itemsId!);
        
                               }
                             else{
                               controller.setFavorite(
                                   itemsModel.itemsId!, "0");
                               controller.deleteFavorite(itemsModel.itemsId!);
        
                             }
        
        
                            },
                            icon: Icon(
                                controller.isFavorite[itemsModel.itemsId] == "1"
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: AppColor.red)))
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
