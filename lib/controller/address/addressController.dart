
import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/addressData.dart';
import 'package:ecommerce/data/model/addressModel.dart';
import 'package:get/get.dart';

import '../../core/function/handlingData_controller.dart';

abstract class AddressController extends GetxController{
  goToAddressDetailsPage();
  getData();
  deleteAddress(String addressId);

}

class AddressControllerImp extends AddressController{
  StatusRequest statusRequest =StatusRequest.none;
  AddressData addressData =AddressData(Get.find());
  MyServices myServices =Get.find();
  List<AddressModel> data=[];
  @override
  void onInit() {
    getData();
    super.onInit();
  }


  @override
  goToAddressDetailsPage() {
    Get.toNamed(AppRoute.addressDetails);
  }

  @override
  getData()async {
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
        statusRequest =StatusRequest.failure;

      }
    }    update();
  }
  @override
  deleteAddress(String addressId)async {
    statusRequest =StatusRequest.loading;
    update();
    var response = await addressData.delete(addressId);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        data.clear();
        getData();
      }
      else{
        statusRequest =StatusRequest.failure;

      }
    }
  }
  
}