import 'package:ecommerce/controller/itemsDetailsPageController.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/translateData.dart';
import 'package:ecommerce/view/widget/itemsDetailsPage/subItemsList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/itemsDetailsPage/countAndPriceItems.dart';
import '../widget/itemsDetailsPage/topPageItemsDetails.dart';

class ItemsDetailsPage extends StatelessWidget {
  const ItemsDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsDetailsPageControllerImp controller =
        Get.put(ItemsDetailsPageControllerImp());
    return Scaffold(
      bottomNavigationBar: InkWell(
        onTap: (){
         controller.goToCart();
        },
        child: Container(
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(15.0)),
          height: 42,
          child: const Center(
            child: Text(
              "Go To Cart",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: AppColor.white),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          const TopItemsPageDetails(),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: GetBuilder<ItemsDetailsPageControllerImp>(builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest, widget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Text(
                  "${translateData(controller.itemsModel.itemsNameAr, controller.itemsModel.itemsName)}",
                  style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: AppColor.blue900),
                ),
                CountAndPrice(onPressedAdd: () {
                  controller.addItemsCountAndAddToCart();

                }, onPressedDelete: () {
                  controller.deleteItemsCountAndDeleteFromCart();

                },),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  "${translateData(controller.itemsModel.itemsDesAr, controller.itemsModel.itemsDes)}",
                  style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: AppColor.blue700),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  "Color",
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: AppColor.blue900),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const SubItemsList()
              ],
            ))),
          )
        ],
      ),
    );
  }
}
