import 'package:get/get.dart';
import '../../core/class/statusRequest.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handlingData_controller.dart';
import '../../data/datasource/remote/auth/verfiyCodeSignUp.dart';

abstract class VerificationCodeSignUpController extends GetxController {
  goToSuccessSignUp(String verificationCode);

  checkCode();
}

class VerificationCodeSignUpControllerImp
    extends VerificationCodeSignUpController {
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());
  String? email;
  StatusRequest statusRequest =StatusRequest.none;
  @override
  goToSuccessSignUp(verificationCode)async {
    statusRequest =StatusRequest.loading;
    update();
    var response = await verifyCodeSignUpData.postData(email!, verificationCode);
    statusRequest=handlingData(response);
    print("response; ${response['status']}");
    print("---------------frpm signup $statusRequest");
    if(StatusRequest.success==statusRequest){
      print(response);
      if(response['status']=="success"){
        // data.addAll(response['data']);
        Get.offNamed(AppRoute.successSignUp);
      }
      else{
        Get.defaultDialog(title: "Warning",middleText: "VerifyCode is Not Correct ");
        statusRequest =StatusRequest.failure;
      }
    }
    update();

  }

  @override
  checkCode() {}

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }

}
