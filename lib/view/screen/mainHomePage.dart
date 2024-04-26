import 'package:ecommerce/controller/mainHomePageController.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/customButtomAppBarMainHome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainHomePageControllerImp());
    return GetBuilder<MainHomePageControllerImp>(
        builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(

                backgroundColor: AppColor.primaryColor,
                onPressed: () {
                  Get.toNamed(AppRoute.cart);
                },
                child: const Icon(Icons.shopping_bag_sharp),
              ),
              resizeToAvoidBottomInset: false,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: const CustomButtomAppBar(),
              body: controller.listPage.elementAt(controller.currentPage),
            ));
  }
}
