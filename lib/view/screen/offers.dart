import 'package:ecommerce/controller/favoriteController.dart';
import 'package:ecommerce/controller/offersController.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/homePage/customAppBar.dart';
import 'package:ecommerce/view/widget/itemsPage/customListItems.dart';
import 'package:ecommerce/view/widget/offers/customListItemsOffers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    OffersPageControllerImp controller =Get.put(OffersPageControllerImp());
    Get.put(FavoriteController());
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: ListView(children: [
          CustomAppBar(hintText: "Search", onPressedIconNotification: (){}, onPressedIconFavorite: (){}),
         const SizedBox(height: 16.0,),
          GetBuilder<OffersPageControllerImp>(builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(itemCount: controller.data.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (
                  BuildContext context,int index)=>CustomListItemsOffers(itemsModel: controller.data[index]))))
        ],),
      ),
    );
  }
}
