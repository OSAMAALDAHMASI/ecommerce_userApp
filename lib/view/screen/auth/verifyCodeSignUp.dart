import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/auth/customTextBodyAuth.dart';
import 'package:ecommerce/view/widget/auth/customTextPageName.dart';
import 'package:ecommerce/view/widget/auth/sharedPageLoginAndSignUp_StartPoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/VerificationCodeSignUpController.dart';

class VerificationCodeSignUp extends StatelessWidget {
  const VerificationCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerificationCodeSignUpControllerImp());
    final screenwidth = MediaQuery.of(context).size.width;
    return GetBuilder<VerificationCodeSignUpControllerImp>(
        builder: (controller) =>
            controller.statusRequest == StatusRequest.loading
                ? const MySharedPage(
                    child: Center(
                      child: Text("Loading ..."),
                    ),
                    title: "Loading . . .")
                : MySharedPage(
                    title: "Verification ",
                    child: Column(
                      children: [
                        const Spacer(
                          flex: 1,
                        ),
                        const CustomTextPageName(text: "Verification Code"),
                        const Spacer(
                          flex: 1,
                        ),
                        CustomTextBodyAuth(
                            text:
                                "Enter the code you sent to \n ${controller.email}"),
                        const Spacer(
                          flex: 1,
                        ),
                        OtpTextField(
                          fieldWidth: screenwidth / 20 * 2,
                          numberOfFields: 5,
                          textStyle: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          // borderColor: Colors.green,
                          focusedBorderColor: AppColor.primaryColor,
                          // styles: otpTextStyles,
                          showFieldAsBox: true,
                          filled: true,
                          fillColor: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(20.0),
                          borderWidth: 2.0,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here if necessary
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            controller.goToSuccessSignUp(verificationCode);
                          },
                        ),
                        const Spacer(
                          flex: 15,
                        ),
                      ],
                    )));
  }
}
