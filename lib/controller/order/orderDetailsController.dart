import 'dart:async';
import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/data/datasource/remote/orders/detailsOrderData.dart';
import 'package:ecommerce/data/model/orderDetailsModel.dart';
import 'package:ecommerce/data/model/orderModel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/function/handlingData_controller.dart';

abstract class OrderDetailsController extends GetxController{
  getData();

}
class OrderDetailsControllerImp extends OrderDetailsController{
 late OrderModel orderModel;
 final Completer<GoogleMapController> controllerMap =
 Completer<GoogleMapController>();
 CameraPosition? kGooglePlex ;
 List<Marker> marker =[];
 List<OrderDetailsModel> data =[];
 StatusRequest statusRequest =StatusRequest.none;
 DetailsOrderData detailsOrderData =DetailsOrderData(Get.find());



  @override
  void onInit() {
    initialData();
    getData();
    super.onInit();
  }

 initialData(){
   orderModel =Get.arguments["data"];
   if(orderModel.ordersDeliveryType=="1"){
     kGooglePlex =CameraPosition(
         target: LatLng(double.parse(orderModel.addressLat!),double.parse(orderModel.addressLong!)),
         zoom: 19.151926040649414
     );
     marker.add(Marker(markerId:const MarkerId("1"),position: LatLng(double.parse(orderModel.addressLat!),double.parse(orderModel.addressLong!)) ));
   }
 }

 @override
 getData() async {
   statusRequest = StatusRequest.loading;
   update();
   var response = await detailsOrderData.getData(orderModel.ordersId);
   statusRequest = handlingData(response);
   if (StatusRequest.success == statusRequest) {
     if (response['status'] == "success") {
       List responseData = response['data'];
       data.clear();
       data.addAll(responseData.map((e) => OrderDetailsModel.fromJson(e)));
     } else {
       statusRequest = StatusRequest.failure;
     }
   }
   update();
 }
}