import 'package:ecommerce/controller/mainHomePageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'homePage/customButtonAppBar.dart';

class CustomButtomAppBar extends StatelessWidget {
  const CustomButtomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: GetBuilder<MainHomePageControllerImp>(builder: (controller)=>Row(
          children: [
            ...List.generate(controller.listPage.length+1, (index){
              int i =index>2?index-1:index;
              return index==2?const Spacer(): CustomButtonAppBar(
                onPressed: () {
                  controller.changePage(i);
                },
                text: controller.listButtonAppBar[i]['name'],
                iconData: controller.listButtonAppBar[i]['icon'], selected: controller.currentPage==i?true:false,
              );
            } )
          ],
        )));
  }
}
