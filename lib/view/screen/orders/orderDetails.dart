import 'package:ecommerce/controller/order/orderDetailsController.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrderDetailsControllerImp controller = Get.put(OrderDetailsControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: Container(
          margin: const EdgeInsets.all(16.0),
          child: Card(
              child: Container(
                margin: const EdgeInsets.all(16.0),
                child: GetBuilder<OrderDetailsControllerImp>(builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest, widget: ListView(

                  children: [
                    Table(children: [
                      const TableRow(
                          children: [
                            // Text("${controller.orderModel.ordersOrderPrice}",textAlign: TextAlign.center),
                            Text("Items",textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: AppColor.primaryColor)),
                            Text("QTY",textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: AppColor.primaryColor)),
                            Text("Price",textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: AppColor.primaryColor)),
                          ]),
                      ...List.generate(controller.data.length, (index) => TableRow(
                          children: [
                            Text("${controller.data[index].itemsName}",textAlign: TextAlign.center,style: const TextStyle(fontSize: 16.0,color: AppColor.blue900)),
                            Text("${controller.data[index].itemsCount}",textAlign: TextAlign.center,style: const TextStyle(fontSize: 16.0,color: AppColor.blue900)),
                            Text("${controller.data[index].itemsPrice}\$",textAlign: TextAlign.center,style: const TextStyle(fontSize: 16.0,color: AppColor.blue900)),
                          ]))


                    ],),
                    const SizedBox(height: 16.0,),
                    Card(child: Table(children: [
                      const TableRow(
                          children: [
// Text("${controller.orderModel.ordersOrderPrice}",textAlign: TextAlign.center),
                            Text("Order Price",textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: AppColor.primaryColor)),
                            Text("Delivery Price",textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: AppColor.primaryColor)),
                            Text("Total Price",textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: AppColor.primaryColor)),
                          ]),
                      TableRow(
                          children: [
                            Text("${controller.orderModel.ordersOrderPrice}\$",textAlign: TextAlign.center,style: const TextStyle(fontSize: 16.0,color: AppColor.blue900)),
                            Text("${controller.orderModel.ordersDeliveryPrice}\$",textAlign: TextAlign.center,style: const TextStyle(fontSize: 16.0,color: AppColor.blue900)),
                            Text("${controller.orderModel.ordersTotalPrice}\$",textAlign: TextAlign.center,style: const TextStyle(fontSize: 16.0,color: AppColor.blue900)),
                          ]),
                    ],),),
                    const SizedBox(height: 16.0,),
                    Row(
                      children: [
                        const Text("Shipping Address",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: AppColor.primaryColor)),
                        if(controller.orderModel.ordersDeliveryType=="0")   Spacer(),
                        if(controller.orderModel.ordersDeliveryType=="0")   const Text("Recive",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: AppColor.red)),
                      ],
                    ),

                   if(controller.orderModel.ordersDeliveryType=="1") ListTile(
                      title: Text("${controller.orderModel.addressName}",style: const TextStyle(color: AppColor.blue800)),
                      subtitle: Text("${controller.orderModel.addressCity}-${controller.orderModel.addressStreet}",style: const TextStyle(color: AppColor.blue800)),
                      leading: const Icon(Icons.location_city_outlined,color: AppColor.primaryColor,),
                      trailing: FittedBox(
                        child:  Text("${controller.orderModel.addressType}",style: const TextStyle(color: AppColor.blue800),),
                      ),
                    ),
                    if(controller.orderModel.ordersDeliveryType=="1")  SizedBox(
                      height: 250,
                      child: GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: controller.kGooglePlex!,
                          markers: controller.marker.toSet(),
                          onMapCreated: (GoogleMapController controller2) {
                            controller.controllerMap.complete(controller2);
                          }),
                    ),

                  ],
                ))),
              ))),
    );
  }
}
