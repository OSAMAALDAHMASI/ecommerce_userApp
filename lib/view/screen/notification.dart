import 'package:ecommerce/controller/notificationsController.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationsControllerImp controller =
        Get.put(NotificationsControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: Container(margin: const EdgeInsets.all(16.0),child: GetBuilder<NotificationsControllerImp>(builder: (controller)=>HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (BuildContext context, int index) => Card(child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("${controller.data[index].notificationsTitle}"),
                        Text("${controller.data[index].notificationsBody}"),

                      ]),
                  Text(
                      textAlign:TextAlign.end,
                      Jiffy.parse(
                          "${controller.data[index].notificationsDate}")
                          .fromNow())
                ],
              ),
            ),)),
      )),),
    );
  }
}
