import 'package:ecommerce/controller/order/pendingController.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/orders/customOrderCardPending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Pending extends StatelessWidget {
  const Pending({super.key});

  @override
  Widget build(BuildContext context) {
    PendingControllerImp controller = Get.put(PendingControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: Container(
          margin: const EdgeInsets.all(16.0),
          child: GetBuilder<PendingControllerImp>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return CustomOrderCardPending(index: index,);
                    },
                  )))),
    );
  }
}
