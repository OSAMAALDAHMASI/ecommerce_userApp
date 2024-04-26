import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/homePageData.dart';
import 'package:ecommerce/data/model/itemsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/function/handlingData_controller.dart';

abstract class HomePageController extends GetxController {
  initialData();
  getData();
  goToItems(List categories,int selectedCategories,String categoriesId);
}

class HomePageControllerImp extends HomePageController {

  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  HomePageData homePageData = HomePageData(Get.find());
  List data = [];
  List categories = [];
  List items = [];
  String? lang;

  @override
  initialData() {
    lang=myServices.sharedPreferences.getString("lang");
    searchTextFiledController=TextEditingController();
  }

  @override
  void onInit() {
    initialData();
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homePageData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItems(List categories,int selectedCategories,String categoriesId ) {
  Get.toNamed(AppRoute.itemsPage,arguments: {
    "categories":categories,
    "selectedCategories":selectedCategories,
    "categoriesId":categoriesId

  });
  }


  TextEditingController? searchTextFiledController;
List <ItemsModel> dataSearchListItems=[];
  search(String searchText)async{
    if(searchText.isNotEmpty){
      statusRequest = StatusRequest.loading;
      update();
      var response = await homePageData.search(searchText);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          dataSearchListItems.clear();
          List responseData=response['data'];
          print("----------------------");
          print(responseData);
          dataSearchListItems.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }
  bool inSearch =false;
  cheackOnSearch(String val){
    if(val.isEmpty||val==" "){
      inSearch=false;
      dataSearchListItems.clear();
      statusRequest =StatusRequest.none;
    }
    else{
      inSearch=true;
    }
    update();

  }




}



