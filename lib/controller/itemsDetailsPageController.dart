import 'package:ecommerce/controller/cartController.dart';
import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/data/model/itemsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../core/function/handlingData_controller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/cartData.dart';

abstract class ItemsDetailsPageController extends GetxController {
  addItemsCountAndAddToCart();
  deleteItemsCountAndDeleteFromCart();
  goToCart();

}

class ItemsDetailsPageControllerImp extends ItemsDetailsPageController {
  late ItemsModel itemsModel;
  StatusRequest statusRequest =StatusRequest.none;
  int itemsCount =0;
// CartControllerImp cartController =Get.put(CartControllerImp());
  List subItems = [
    {
      "name": "blue",
      "id": "1",
      "active": "1",
    },
    {
      "name": "red",
      "id": "2",
      "active": "0",
    },
    {
      "name": "yellow",
      "id": "3",
      "active": "0",
    }
  ];
  MyServices myServices =Get.find();
  CartData cartData = CartData(Get.find());

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  void initialData() async{
    statusRequest =StatusRequest.loading;
    itemsModel = Get.arguments['itemsModel'];
    itemsCount= await getItemsCount(itemsModel.itemsId!)??0;
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  addItemsCountAndAddToCart() {
    addCart(itemsModel.itemsId!);
    itemsCount++;
    update();
  }
  @override
  deleteItemsCountAndDeleteFromCart() {
    if(itemsCount>0){
      deleteCart(itemsModel.itemsId!);
      itemsCount--;
      update();
    }
    else{
      return;
    }
  }

  addCart(itemsId)async {
    statusRequest =StatusRequest.loading;
    var response = await cartData.add(myServices.sharedPreferences.getString("id"), itemsId);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        // Get.rawSnackbar(title:"Success" ,messageText: const Text("Add to Cart",style: TextStyle(
        //     color: Colors.white
        //
        // )));
      }
      else{
        statusRequest =StatusRequest.failure;

      }
    }
    update();
  }


  deleteCart(String itemsId)async {
    statusRequest =StatusRequest.loading;
    var response = await cartData.delete(myServices.sharedPreferences.getString("id"), itemsId);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        // Get.rawSnackbar(title:"Success" ,messageText: const Text("delete From Cart",style: TextStyle(
        //     color: Colors.white
        //
        // )));
      }
      else{
        statusRequest =StatusRequest.failure;

      }
    }
    update();
  }

  getItemsCount(itemsId) async{
    statusRequest =StatusRequest.loading;
    var response = await cartData.getItemsCount(myServices.sharedPreferences.getString("id"), itemsId);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        int itemsCount =int.parse(response['data']);
        return itemsCount;
      }
      else{
        statusRequest =StatusRequest.failure;

      }
    }    update();
  }
CartControllerImp controllerImp =CartControllerImp();
  @override
  goToCart() {
    Get.toNamed(AppRoute.cart);
    controllerImp.refreshPage();
  }





}
