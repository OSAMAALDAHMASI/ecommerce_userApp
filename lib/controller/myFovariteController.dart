import 'package:ecommerce/data/datasource/remote/favorite.dart';
import 'package:ecommerce/data/model/myFovriteModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusRequest.dart';
import '../core/function/handlingData_controller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/myFavoriteData.dart';

class MyFavoriteController extends GetxController{

  Map isFavorite ={};
  StatusRequest statusRequest =StatusRequest.none;
  List<MyFavoriteModel> data=[];
  MyServices myServices =Get.find();
  MyFavoriteData myFavoriteData=MyFavoriteData((Get.find())) ;

  @override
  void onInit() {
    getData();
    super.onInit();
  }
  getData()async{
    statusRequest =StatusRequest.loading;
    update();
    var response = await myFavoriteData.getData(myServices.sharedPreferences.getString("id"));
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success") {
        List responseData =response['data'];
  data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));
     print("data");
     print(data);
      }
      else{
        statusRequest =StatusRequest.failure;

      }
    }
    update();
  }


  deleteData(favoriteId)async{

    var response = await myFavoriteData.deleteData(favoriteId);
    statusRequest=handlingData(response);
        data.removeWhere((element) => element.favoriteId==favoriteId);
        Get.rawSnackbar(title:"Success" ,messageText:  const Text("delete from Favorite",style: TextStyle(
            color: Colors.white

        ),));

    update();
  }
  // deleteData(favoriteId)async{
  //   statusRequest =StatusRequest.loading;
  //   update();
  //   var response = await myFavoriteData.deleteData(favoriteId);
  //   statusRequest=handlingData(response);
  //   update();
  //   if(StatusRequest.success==statusRequest){
  //     if(response['status']=="success") {
  //       data.removeWhere((element) => element.favoriteId==favoriteId);
  //       Get.rawSnackbar(title:"Success" ,messageText:  const Text("delete from Favorite",style: TextStyle(
  //           color: Colors.white
  //
  //       ),));
  //     }
  //     else{
  //       statusRequest =StatusRequest.failure;
  //       Get.rawSnackbar(title:"Failure" ,messageText:  const Text("Can't delete from Favorite Now !",style: TextStyle(
  //           color: Colors.white
  //
  //       ),));
  //
  //     }
  //   }
  //   update();
  // }


}