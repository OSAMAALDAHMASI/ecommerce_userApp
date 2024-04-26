import 'package:ecommerce/controller/order/ArchiveController.dart';
import 'package:ecommerce/controller/order/pendingController.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/orders/customOrderCardArchive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Archive extends StatelessWidget {
  const Archive({super.key});

  @override
  Widget build(BuildContext context) {
    ArchiveControllerImp controller = Get.put(ArchiveControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: Container(
          margin: const EdgeInsets.all(16.0),
          child: GetBuilder<ArchiveControllerImp>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return CustomOrderCardArchive(index: index);
                    },
                  )))),
    );
  }
}
