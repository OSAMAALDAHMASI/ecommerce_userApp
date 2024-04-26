import 'package:ecommerce/controller/order/ArchiveController.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CustomOrderCardArchive extends GetView<ArchiveControllerImp> {
  final int index;
  const CustomOrderCardArchive( {super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            margin: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Order Number  #${controller.data[index].ordersId}",
                      style: const TextStyle(
                          fontSize: 20.0,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    FittedBox(
                      child: Text(
                          Jiffy.parse(
                              "${controller.data[index].ordersDate}")
                              .fromNow(),
                          style: const TextStyle(
                              color: AppColor.blue50,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                Text(
                  "Order Type : ${controller.ordersDeliveryType(controller.data[index].ordersDeliveryType)}",
                  style: const TextStyle(
                      color: AppColor.blue900,
                      fontSize: 16.0),
                ),
                Text(
                  "Payment Method : ${controller.ordersPaymentMethod(controller.data[index].ordersPaymentMethod)}",
                  style: const TextStyle(
                      color: AppColor.blue900,
                      fontSize: 16.0),
                ),
                Text(
                  "Order Price : ${controller.data[index].ordersOrderPrice}\$",
                  style: const TextStyle(
                      color: AppColor.blue900,
                      fontSize: 16.0),
                ),
                Text(
                  "Delivery Price : ${controller.data[index].ordersDeliveryPrice}\$",
                  style: const TextStyle(
                      color: AppColor.blue900,
                      fontSize: 16.0),
                ),
                Text(
                  "Order Status : ${controller.ordersStatus(controller.data[index].ordersStatus!)}",
                  style: const TextStyle(
                      color: AppColor.blue900,
                      fontSize: 16.0),
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Price : ${controller.data[index].ordersTotalPrice}\$",
                      style: const TextStyle(
                          color: AppColor.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.goToOrderDetailsPage(index);
                        },
                        child: const Text("Details"))
                  ],
                )
              ],
            )));
  }
}
