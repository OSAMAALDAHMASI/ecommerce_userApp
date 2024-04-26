import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/homePageController.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/homePage/customAppBar.dart';
import 'package:ecommerce/view/widget/homePage/customTitleHome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/color.dart';
import '../../core/function/translateData.dart';
import '../../linkApi.dart';
import '../widget/homePage/customCardHome.dart';
import '../widget/homePage/customListCategoriesHome.dart';
import '../widget/homePage/customListItemsHome.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    return GetBuilder<HomePageControllerImp>(
        builder: (controller) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: [
              CustomAppBar(
                hintText: "Find A Product", onPressedIconFavorite: () {
                Get.toNamed(AppRoute.myFavoritePage);
              }, onPressedIconNotification: () {  },),
              HandlingDataView(statusRequest: controller.statusRequest, widget:

              controller.inSearch==true?ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.dataSearchListItems.length,
                  itemBuilder: (BuildContext context,int index)=>CardItemsSearch(imageUrl: controller.dataSearchListItems[index].itemsImage!, itemsName: '${translateData(controller.dataSearchListItems[index].itemsNameAr, controller.dataSearchListItems[index].itemsName)}', itemsPrice: '${controller.dataSearchListItems[index].itemsPrice}')):
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                CustomCardHome(
                  textTitle: 'A Summer Surprise',
                  textBody: 'Cashback 20%',
                ),
                CustomTitleHome(textTitle: "Categories"),
                CustomListCategoriesHome(),
                SizedBox(height: 16.0),
                CustomTitleHome(textTitle: "Product For You"),
                CustomListItemsHome()
              ],))
            ],
          ),
        ));
  }
}


class CardItemsSearch extends StatelessWidget {
  final String imageUrl;
  final String itemsName;
  final String itemsPrice;
  const CardItemsSearch({super.key, required this.imageUrl, required this.itemsName, required this.itemsPrice, });

  @override
  Widget build(BuildContext context) {
    return Card(child: Row(children: [
      Expanded(
          flex: 2,
          child: Container(
              margin: const EdgeInsets.all(16.0),
              child: CachedNetworkImage(imageUrl:"${AppApiLink.imagesItems}/$imageUrl"))),
      Expanded(
          flex: 3,
          child: ListTile(title: Text(itemsName),
            subtitle: Text("$itemsPrice\$",style: const TextStyle(color: AppColor.red,fontSize: 17.0),),
          )),

    ],),);
  }
}
