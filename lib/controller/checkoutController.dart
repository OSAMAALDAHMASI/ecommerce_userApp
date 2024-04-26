import 'package:ecommerce/controller/address/addressController.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/datasource/remote/checkoutData.dart';
import 'package:get/get.dart';

import '../core/class/statusRequest.dart';
import '../core/function/handlingData_controller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/addressData.dart';
import '../data/model/addressModel.dart';

abstract  class CheckoutController extends GetxController{
  choosePaymentMethod(String val);
  chooseDeliveryType(String val);
  chooseShippingAddress(String val);
  getAddressCheckout();
  checkout();
}

class CheckoutControllerImp extends CheckoutController{
  String? paymentMethod;
  String? deliveryType;
  String? shippingAddressId;
  StatusRequest statusRequest =StatusRequest.none;
  AddressData addressData =AddressData(Get.find());
  MyServices myServices =Get.find();
  List<AddressModel> data=[];
  String? priceOrders ;
  String? couponId;

  @override
  void onInit() {
    priceOrders =Get.arguments['orderPrice'];
    couponId =Get.arguments['couponId'];
    getAddressCheckout();
    super.onInit();
  }

  @override
  chooseDeliveryType(String val) {
    deliveryType=val;
    update();
  }

  @override
  choosePaymentMethod(String val) {
    paymentMethod=val;
    update();
  }

  @override
  chooseShippingAddress(String val) {
    shippingAddressId=val;
    update();
  }

  @override
  getAddressCheckout()async {
    statusRequest =StatusRequest.loading;
    update();
    var response = await addressData.getData(myServices.sharedPreferences.getString("id")!,);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        List responseData= response['data'];
        data.clear();
        data.addAll(responseData.map((e) => AddressModel.fromJson(e)));
      }
      else{
        statusRequest =StatusRequest.none;

      }
    }
    update();
  }
  CheckoutData checkoutData=CheckoutData(Get.find());
  @override
  checkout()async {
  if(paymentMethod==null){
   return Get.snackbar("Error", "please Select Payment Method");
  }
    else if(deliveryType==null){
    return Get.snackbar("Error", "please Select delivery Type ");
  }
  if(deliveryType=="1" && data.isEmpty){
    return  Get.snackbar("Error", "please Add shipping Address ");
  }
      if(deliveryType=="1" && shippingAddressId==null){
        return  Get.snackbar("Error", "please Select shipping Address ");
      }
      else{
        statusRequest = StatusRequest.loading;
        update();
        Map  data={
          "paymentMethod":paymentMethod.toString(),
          "deliveryType": deliveryType.toString(),
          "couponId": couponId.toString(),
          "orderPrice": priceOrders.toString(),
          "deliveryPrice": "10",
          "userId":myServices.sharedPreferences.getString("id")!,
          "addressId":shippingAddressId.toString(),
        };
        var response = await checkoutData.checkout(data);
        statusRequest = handlingData(response);
        if (StatusRequest.success == statusRequest) {
          if (response['status'] == "success") {
            Get.offAllNamed(AppRoute.homePage);
            Get.snackbar("Success", "Order Success");
          } else {
            statusRequest = StatusRequest.none;
            Get.snackbar("Error", "Try order again");
          }
        }
        update();
      }



  }

}