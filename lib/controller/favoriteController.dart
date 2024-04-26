import 'package:ecommerce/data/datasource/remote/favorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusRequest.dart';
import '../core/function/handlingData_controller.dart';
import '../core/services/services.dart';

class FavoriteController extends GetxController{

 Map isFavorite ={};
 StatusRequest statusRequest =StatusRequest.none;
 // List data=[];
 MyServices myServices =Get.find();
 FavoriteData favoriteData=FavoriteData((Get.find())) ;
 setFavorite(String id,String val){
   isFavorite[id]=val;
   update();
 }

 addFavorite(String itemsId)async{
   statusRequest =StatusRequest.loading;
   var response = await favoriteData.add(myServices.sharedPreferences.getString("id"), itemsId);
   statusRequest=handlingData(response);
   if(StatusRequest.success==statusRequest){
     if(response['status']=="success"){
       Get.rawSnackbar(title:"Success" ,messageText: const Text("Add to Favorite",style: TextStyle(
           color: Colors.white

       )));
     }
     else{
       statusRequest =StatusRequest.failure;

     }
   }
 }
 deleteFavorite(String itemsId)async{
   statusRequest =StatusRequest.loading;
   update();
   var response = await favoriteData.delete(myServices.sharedPreferences.getString("id"), itemsId);
   statusRequest=handlingData(response);
   if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
       print(response);
       Get.rawSnackbar(title:"Success" ,messageText:  const Text("delete from Favorite",style: TextStyle(
           color: Colors.white

       ),));
     }
     else{
       statusRequest =StatusRequest.failure;

     }
   }
 }

}