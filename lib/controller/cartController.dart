import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/cartData.dart';
import 'package:ecommerce/data/model/couponModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/function/handlingData_controller.dart';
import '../data/model/cartModel.dart';

abstract class CartController extends GetxController {
  deleteCart(String itemsId);

  addCart(String itemsId);

  getItemsCount(String itemsId);

  getData();

  applyCoupon();

  goToCheckoutPage();
}

class CartControllerImp extends CartController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  List<CartModel> data = [];
  double priceOrders = 0.0;
  double priceOrdersWithDiscount = 0.0;
  int totalCountItems = 0;
  late TextEditingController couponController;
  CouponModel couponModel = CouponModel();
  String? couponName;
  double? totalPriceWithCouponDiscount;
  int couponDiscount = 0;
  String? couponId;

  @override
  void onInit() {
    super.onInit();
    couponController = TextEditingController();
    getData();
  }

  refreshPage() {
    resetData();
    getData();
  }

  resetData() async {
    priceOrders = 0.0;
    priceOrdersWithDiscount = 0.0;
    totalCountItems = 0;
    data.clear();
    update();
  }

  @override
  addCart(itemsId) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.add(
        myServices.sharedPreferences.getString("id"), itemsId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // Get.rawSnackbar(title:"Success" ,messageText: const Text("Add to Cart",style: TextStyle(
        //     color: Colors.white
        //
        // )));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  deleteCart(String itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.delete(
        myServices.sharedPreferences.getString("id"), itemsId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  getItemsCount(itemsId) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getItemsCount(
        myServices.sharedPreferences.getString("id"), itemsId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int itemsCount = int.parse(response['data']);
        return itemsCount;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getData(
      myServices.sharedPreferences.getString("id"),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['data']['status'] == 'success') {
          List responseData = response['data']['data'];
          data.clear();
          data.addAll(responseData.map((e) => CartModel.fromJson(e)));
          priceOrders =
              double.parse(response['totalPriceAndCount']['totalPrice']);
          priceOrdersWithDiscount = double.parse(
              response['totalPriceAndCount']['totalPriceWithDiscount']);
          totalCountItems =
              int.parse(response['totalPriceAndCount']['totalCount']);
          update();
        } else {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  applyCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(couponController.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> responseData = response['data'];
        couponModel = CouponModel.fromJson(responseData);
        couponName = couponModel.couponsName;
        couponId = couponModel.couponsId;
        couponDiscount = int.parse(couponModel.couponsDiscount!);
        totalPriceWithCouponDiscount = (priceOrdersWithDiscount -
            (priceOrdersWithDiscount * couponDiscount / 100));
      } else {
        statusRequest = StatusRequest.none;
        totalPriceWithCouponDiscount = null;
        couponName = null;
        couponDiscount = 0;
        Get.snackbar("Error", "This Coupon is Not Correct or expired  ");
      }
    }
    update();
  }

  @override
  goToCheckoutPage() {
    if(totalCountItems==0)return Get.snackbar("Error", "Add product to Continue ");

      Get.toNamed(AppRoute.checkoutPage,arguments: {
        "orderPrice":priceOrdersWithDiscount.toString(),
        "couponId":couponId.toString(),


      });
  }
}
