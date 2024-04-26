import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/statusRequest.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handlingData_controller.dart';
import '../../data/datasource/remote/auth/signUp.dart';

abstract class SignUpController extends GetxController{
  signUp();
  goToLogin();
  showAndHidePassword();
}

class SignUpControllerImp extends SignUpController{
  GlobalKey<FormState> formState =GlobalKey();
 late TextEditingController userName;
 late TextEditingController email;
 late TextEditingController phone;
 late TextEditingController password;
 bool passwordIsShow =true;

  @override
 void goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }


  StatusRequest statusRequest =StatusRequest.none;
  SignupData signupData= SignupData(Get.find() );
  List data=[];

  @override
  signUp()async {
if(formState.currentState!.validate()){
  statusRequest =StatusRequest.loading;
  update();
  var response = await signupData.postData(userName.text.trim(), email.text.trim(), phone.text.trim(), password.text.trim());
  statusRequest=handlingData(response);
  print("response; ${response['status']}");
  print("---------------frpm signup $statusRequest");
  if(StatusRequest.success==statusRequest){
    if(response['status']=="success"){
      // data.addAll(response['data']);
      Get.offAllNamed(AppRoute.verificationCodeSignUp,arguments: {"email":email.text.trim()});
    }
    else{
      Get.defaultDialog(title: "Warning",middleText: "Phone Number or Email Already Exists");
      statusRequest =StatusRequest.failure;
    }
  }
  update();

}else{}
  }
  @override
  void onInit() {
    email = TextEditingController();
    userName = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    userName.dispose();
    password.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  showAndHidePassword() {
    passwordIsShow=!passwordIsShow ;
    update();
  }

}