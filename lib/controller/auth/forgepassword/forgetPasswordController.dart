import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/data/datasource/remote/auth/forgetpassword/checkEmail.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/constant/routes.dart';
import '../../../core/function/handlingData_controller.dart';

abstract class ForgetPasswordController extends GetxController{
  checkEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController{
  late TextEditingController email;
  GlobalKey<FormState> formState =GlobalKey();



CheckEmailData checkEmailData = CheckEmailData(Get.find());
StatusRequest statusRequest =StatusRequest.none;
  @override
  checkEmail()async {
    if(formState.currentState!.validate()){
      statusRequest =StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(email.text.trim(),);
      statusRequest=handlingData(response);
      if(StatusRequest.success==statusRequest){
        if(response['status']=="success"){
          // data.addAll(response['data']);
          Get.offAllNamed(AppRoute.verificationCodeForgetPassword ,arguments: {"email":email.text.trim()});
        }
        else {
          Get.defaultDialog(title: "Warning",middleText: "Email is Not found!");
          statusRequest =StatusRequest.failure;
        }
      }
      update();

    }
  }

  @override
  void onInit() {
    email =TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

}