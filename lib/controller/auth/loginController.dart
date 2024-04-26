import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handlingData_controller.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
  showAndHidePassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey();
  late TextEditingController email;
  late TextEditingController password;
  bool passwordIsShow = true;
  MyServices myServices = Get.put(MyServices());

  @override
  goToSignUp() {
    Get.toNamed(AppRoute.signUp);
  }

  StatusRequest statusRequest = StatusRequest.none;

  LoginData loginData = LoginData(Get.find());

  @override
  login() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await loginData.postData(email.text.trim(), password.text.trim());
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          myServices.sharedPreferences
              .setString("id", response['data']['users_id']);
          String userId=myServices.sharedPreferences.getString("id")!;
          myServices.sharedPreferences
              .setString("userName", response['data']['users_name']);
          myServices.sharedPreferences
              .setString("email", response['data']['users_email']);
          myServices.sharedPreferences
              .setString("phone", response['data']['users_phone']);
          myServices.sharedPreferences.setString("step", "2");
          FirebaseMessaging.instance.subscribeToTopic("users");
          FirebaseMessaging.instance.subscribeToTopic("users$userId");
          Get.offAllNamed(AppRoute.homePage);
        } else if (response['status'] == "failureApprove") {
          Get.defaultDialog(
              title: "Warning", middleText: "This Email is Not Approve");
          statusRequest = StatusRequest.failure;
        } else {
          Get.defaultDialog(
              title: "Warning", middleText: "Email Or Password is Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
    throw UnimplementedError();
  }

  @override
  showAndHidePassword() {
    passwordIsShow = !passwordIsShow;
    update();
  }
}
