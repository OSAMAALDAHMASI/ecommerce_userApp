 import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/datasource/remote/itemsData.dart';
import 'package:ecommerce/data/model/itemsModel.dart';
import 'package:get/get.dart';

import '../core/function/handlingData_controller.dart';
import '../core/services/services.dart';

 abstract class ItemsPageController extends GetxController{
initialData();
changeCategories(int index,String categoriesId2 );
getItems();
goToItemsDetailsPage(ItemsModel itemsModel);
}

class ItemsPageControllerImp extends ItemsPageController{

 List categories=[];
 List data=[];
late int selectedCategories;
late String categoriesId;
ItemsData itemsData =ItemsData(Get.find());
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
categories=Get.arguments['categories'];
selectedCategories=Get.arguments['selectedCategories'];
categoriesId=Get.arguments['categoriesId'];
  }

  @override
  changeCategories(int index,String categoriesId2)async {
    selectedCategories=index;
    categoriesId=categoriesId2;
    update();
    getItems();
  }

  @override
  getItems() async{
    statusRequest =StatusRequest.loading;
    update();
    var response = await itemsData.getData(categoriesId,myServices.sharedPreferences.getString("id"));
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        data.clear();
        data.addAll(response['data']);}
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

