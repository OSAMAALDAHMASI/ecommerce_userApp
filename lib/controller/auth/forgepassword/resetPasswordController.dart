import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/data/datasource/remote/auth/forgetpassword/resetPassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/constant/routes.dart';
import '../../../core/function/handlingData_controller.dart';

abstract class ResetPasswordController extends GetxController {
  goToSuccessResetPassword();

  showAndHidePassword();

  check();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController rePassword;
  GlobalKey<FormState> formState = GlobalKey();
  bool passwordIsShow = true;
  StatusRequest statusRequest =StatusRequest.none;

  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  String? email;

  @override
  showAndHidePassword() {
    passwordIsShow = !passwordIsShow;
    update();
  }

  @override
  goToSuccessResetPassword() async {
    if (password.text.trim() != rePassword.text.trim()) {
      return Get.defaultDialog(
          title: "Warning", middleText: "password is not Match");
    }
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await resetPasswordData.postData(email!, rePassword.text.trim());
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offAllNamed(AppRoute.login);
        } else {
          Get.defaultDialog(title: "Warning", middleText: "Try Again !");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  check() {}

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}
