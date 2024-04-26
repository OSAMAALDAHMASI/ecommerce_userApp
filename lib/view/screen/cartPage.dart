import 'package:ecommerce/controller/cartController.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/function/translateData.dart';
import 'package:ecommerce/linkApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/cart/customButtomNavgationBarCart.dart';
import '../widget/cart/customCardCart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart",),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<CartControllerImp>(
            builder: (controller) => Column(

              children: [

                Container(
                  alignment: Alignment.center,
                  child: Text(
                      "You Have ${controller.totalCountItems} Items In your List"),
                ),
                Expanded(child: HandlingDataView(statusRequest: controller.statusRequest,widget: ListView.builder(
                  // physics: const NeverScrollableScrollPhysics(),
                  // shrinkWrap: true,
                    itemCount:controller.data.length ,
                    itemBuilder: (BuildContext context,int index){
                      return CustomCardCart(
                        imageUrl:
                        "${AppApiLink.imagesItems}/${controller.data[index].itemsImage!}",
                        itemsName:
                        '${translateData(controller.data[index].itemsNameAr, controller.data[index].itemsName)}',
                        itemsPriceWithDiscount: '${controller.data[index].itemsPriceAllWithDiscount}',
                        itemsPrice: '${controller.data[index].itemsPriceAll}',
                        countItems: '${controller.data[index].itemsCountAll}',
                        addFunction: () {
                          controller.addCart(
                              controller.data[index].itemsId.toString());
                          controller.refreshPage();
                        },
                        deleteFunction: () {
                          controller.deleteCart(
                              controller.data[index].itemsId.toString());
                          controller.refreshPage();
                        },
                      );
                    }),)),
                const CustomButtomNavgationBarCart()

              ],
            )),
      ),
    );
  }
}
