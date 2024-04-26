import 'package:ecommerce/controller/myFovariteController.dart';
import 'package:ecommerce/view/widget/homePage/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/handlingdataview.dart';
import '../widget/myFavorite/customListMyFavoriteItems.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child:
        GetBuilder<MyFavoriteController>(builder: (controller)=>ListView(
          children: [
            CustomAppBar(hintText: "Find A Product", onPressedIconNotification: (){}, onPressedIconFavorite: (){}),
            const SizedBox(height: 20.0,),
            HandlingDataView(statusRequest: controller.statusRequest, widget: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.650
                ),
                itemBuilder: (BuildContext context, int index) {

                  return CustomListMyFavoriteItems(myFavoriteModel: controller.data[index]);
                }
            ))
          ],
        )),),
    );
  }
}
