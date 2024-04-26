import 'package:ecommerce/controller/favoriteController.dart';
import 'package:ecommerce/controller/itemsPageController.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/data/model/itemsModel.dart';
import 'package:ecommerce/view/widget/itemsPage/customListItems.dart';
import 'package:ecommerce/view/widget/itemsPage/listCategoriesItemsPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/homePage/customAppBar.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsPageControllerImp());
    FavoriteController controllerFavorite= Get.put(FavoriteController());
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child:GetBuilder<ItemsPageControllerImp>(builder: (controller)=>
            ListView(
              children: [
                CustomAppBar(
                  hintText: "Find A Product",
                   onPressedIconNotification: () {  }, onPressedIconFavorite: () {  },
                ),
                const CustomListCategoriesItems(),
                HandlingDataView(statusRequest: controller.statusRequest, widget: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.data.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.650
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      controllerFavorite.isFavorite[controller.data[index]['items_id']]=controller.data[index]['favorite'];

                      return  CustomListItems(itemsModel: ItemsModel.fromJson(controller.data[index]));
                    }
                ))
              ],
            )),
      ),
    );
  }
}
