import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/model/orderModel.dart';
import 'package:get/get.dart';
import '../../core/function/handlingData_controller.dart';
import '../../data/datasource/remote/orders/PendingOrderData.dart';

abstract class PendingController extends GetxController{
  getData();
  deleteOrder(String orderId);
  refreshOrderPage();
  goToOrderDetailsPage(int index);
}

class PendingControllerImp extends PendingController{

StatusRequest statusRequest=StatusRequest.none;
PendingOrderData pendingOrderData =PendingOrderData(Get.find());
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
  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingOrderData.getData(
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

  @override
  refreshOrderPage() {
    getData();
  }

  @override
  goToOrderDetailsPage(int index) {
   Get.toNamed(AppRoute.orderDetails,arguments: {"data":data[index]});
  }

  @override
  deleteOrder( orderId) async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingOrderData.deleteOrder(orderId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        refreshOrderPage();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

}