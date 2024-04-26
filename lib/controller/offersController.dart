import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/datasource/remote/itemsData.dart';
import 'package:ecommerce/data/datasource/remote/offersData.dart';
import 'package:ecommerce/data/model/itemsModel.dart';
import 'package:get/get.dart';
import '../core/function/handlingData_controller.dart';
import '../core/services/services.dart';

abstract class OffersPageController extends GetxController{
  initialData();
  getItems();
  goToItemsDetailsPage(ItemsModel itemsModel);
}

class OffersPageControllerImp extends OffersPageController{

  List<ItemsModel> data=[];
  OffersData offersData =OffersData(Get.find());
  StatusRequest statusRequest =StatusRequest.none;
  MyServices myServices =Get.find();
  @override
  void onInit() {
    initialData();
    getItems();
    super.onInit();
  }

  @override
  initialData() {
  }


  @override
  getItems() async{
    statusRequest =StatusRequest.loading;
    update();
    var response = await offersData.getData( myServices.sharedPreferences.getString("id"));
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        data.clear();
        List dataResponse =response['data'];
        data.addAll(dataResponse.map((e) => ItemsModel.fromJson(e)));}
      else{
        statusRequest =StatusRequest.failure;

      }
    }
    update();
  }

  @override
  goToItemsDetailsPage(itemsModel) {
    Get.toNamed(AppRoute.itemsDetailsPage,arguments: {
      "itemsModel":itemsModel
    });
  }



}

