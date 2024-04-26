import 'dart:async';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/addressData.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/statusRequest.dart';
import '../../core/function/handlingData_controller.dart';
import 'addressController.dart';

abstract class AddressDetailsController extends GetxController{
  changeSelectedAddressType(String type);
  getCurrentLocation();
  addMarker(LatLng latLng);
  addAddress();
}


class AddressDetailsControllerImp extends AddressDetailsController {
  MyServices myServices =Get.find();
  final Completer<GoogleMapController> controllerMap =
  Completer<GoogleMapController>();
  CameraPosition? kGooglePlex ;
  AddressData addressData =AddressData(Get.find());

GlobalKey<FormState> formState=GlobalKey();
  StatusRequest statusRequest=StatusRequest.loading;

  List<Map<String,dynamic>> addressType =[
    {
      "name":"Home",
      "icon":Icons.home_outlined
    },
    {
      "name":"Shop",
      "icon":Icons.shop_outlined
    },
    {
      "name":"Office",
      "icon":Icons.local_post_office_outlined
    },
    {
      "name":"Restaurant",
      "icon":Icons.restaurant_outlined
    },
    {
      "name":"Other",
      "icon":Icons.location_city_outlined
    }
  ];



List<Marker> marker =[];


  String selectedAddressType="Home";
  double lat=0.0;
  double long=0.0;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController cityController;
  late TextEditingController streetController;

  initialData(){
    nameController=TextEditingController();
    phoneController=TextEditingController();
    cityController=TextEditingController();
    streetController=TextEditingController();
  }

@override
  void onInit() {
    super.onInit();
    getCurrentLocation();
    initialData();

  }


  @override
  changeSelectedAddressType(String type){
    selectedAddressType=type;
    update();
  }

  @override
  getCurrentLocation() async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    kGooglePlex =CameraPosition(
      target: LatLng(position.latitude, position.longitude),
        zoom: 19.151926040649414
    );
  statusRequest=StatusRequest.none;
  update();
  }

  @override
  addMarker(latLng) {
    marker.clear();
marker.add(Marker(markerId:const MarkerId("1"),position: latLng ));
lat=latLng.latitude;
long=latLng.longitude;
update();
  }

  @override
  addAddress() async{
    if(marker.isEmpty){
      Get.snackbar("warning!", "Please Choose Your Location on The Map");
      }
    else{
      if (formState.currentState!.validate()) {
        statusRequest =StatusRequest.loading;
        update();
        Map<String,dynamic> data={
          "name":nameController.text,
          "usersId":myServices.sharedPreferences.getString("id"),
          "phone":phoneController.text,
          "city":cityController.text,
          "street":streetController.text,
          "lat":  lat.toString(),
          "long":long.toString(),
          "type":selectedAddressType,
        };
        AddressControllerImp addressControllerImp =AddressControllerImp();
        var response = await addressData.add(data);
        statusRequest=handlingData(response);
        if(StatusRequest.success==statusRequest){
          if(response['status']=="success"){
            // addressControllerImp.data.clear();
            // Get.offNamed(AppRoute.addressPage);
            Get.offAllNamed(AppRoute.homePage);
            Get.snackbar("Success", "Add Address Successfully");
            // Get.back();
            // addressControllerImp.data.clear();
            // addressControllerImp.getData();
          }
          else{
            statusRequest =StatusRequest.failure;
          }
        }

      }
      update();
    }


  }
}

