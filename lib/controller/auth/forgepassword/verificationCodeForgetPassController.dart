import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/data/datasource/remote/auth/forgetpassword/verifyCodeForgetPassword.dart';
import 'package:get/get.dart';
import '../../../core/constant/routes.dart';
import '../../../core/function/handlingData_controller.dart';

abstract class VerificationCodeForgetPassController extends GetxController{
  goToResetPassword(String verificationCode);
}

class VerificationCodeForgetPassControllerImp extends VerificationCodeForgetPassController{

String? email;
StatusRequest statusRequest =StatusRequest.none;
VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =VerifyCodeForgetPasswordData(Get.find());
  @override
  goToResetPassword(String verificationCode) async{
    statusRequest =StatusRequest.loading;
    update();
    var response = await verifyCodeForgetPasswordData.postData(email!, verificationCode);
    statusRequest=handlingData(response);
    print("response; ${response['status']}");
    print("---------------frpm signup $statusRequest");
    if(StatusRequest.success==statusRequest){
      print(response);
      if(response['status']=="success"){
        // data.addAll(response['data']);
        Get.offNamed(AppRoute.resetPassword,arguments: {"email":email});
      }
      else{
        Get.defaultDialog(title: "Warning",middleText: "VerifyCode is Not Correct ");
        statusRequest =StatusRequest.failure;
      }
    }
    update();

  }


  @override
  void onInit() {
    email=Get.arguments['email'];
    super.onInit();
    // email =Get.arguments["email"];
  }



}