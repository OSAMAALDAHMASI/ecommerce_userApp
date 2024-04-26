import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingData_controller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/orders/archiveData.dart';
import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../data/model/orderModel.dart';

abstract class ArchiveController extends GetxController{
  getData();
  goToOrderDetailsPage(int index);
}
class ArchiveControllerImp extends ArchiveController{

  StatusRequest statusRequest=StatusRequest.none;
  ArchiveOrderData archiveOrderData =ArchiveOrderData(Get.find());
  MyServices myServices =Get.find();
  List<OrderModel> data=[];
  @override
  void onInit() {
    getData();
    super.onInit();
  }


  String ordersDeliveryType(String? val){
    if(val=="0") {
      return "receive";
    }
    else if(val=="1")
    {return "Delivery";}

    else {return "null";}
  }
  ordersPaymentMethod(String? val){
    if(val=="0") {
      return "cash";
    }
    else if(val=="1")
    {return "Payment Card";}

    else {return "null";}
  }


  ordersStatus(String val) {
    if (val == "0") {
      return "Waiting Approve";
    }
    else if (val == "1") {
      return "Your order is being prepared";
    }

    else if (val == "2"){
      return "Your order is being delivered";
    }
    else if (val == "3"){
      return "Your order in The Way";
    }
    else{
      return "Archive";
    }
  }

  @override
  goToOrderDetailsPage(int index) {
    Get.toNamed(AppRoute.orderDetails,arguments: {"data":data[index]});
  }

  @override
  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await archiveOrderData.getData(
      myServices.sharedPreferences.getString("id"),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.clear();
        data.addAll(responseData.map((e) => OrderModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}