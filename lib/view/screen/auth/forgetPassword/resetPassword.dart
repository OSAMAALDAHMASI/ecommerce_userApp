import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/forgepassword/resetPasswordController.dart';
import '../../../../core/function/validtionTextFiled.dart';
import '../../../widget/auth/customButtonAuth.dart';
import '../../../widget/auth/customTextBodyAuth.dart';
import '../../../widget/auth/customTextFormFiledAuth.dart';
import '../../../widget/auth/customTextPageName.dart';
import '../../../widget/auth/sharedPageLoginAndSignUp_StartPoint.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return MySharedPage(
      allowMove: false,
        title: "   ",
        child: Form(
          key: controller.formState,
          child: Column(
            children: [
              const Spacer(
                flex: 1,
              ),
              const CustomTextPageName(text: "New Password"),
              const Spacer(
                flex: 1,
              ),
              const CustomTextBodyAuth(
                  text: "Enter New Password"),
              const Spacer(
                flex: 1,
              ),
              GetBuilder<ResetPasswordControllerImp>(
                  builder: (controller) => CustomTextFormFieldAuth(
                    obscureText: controller.passwordIsShow,
                    isPassword: true,
                    onPressedPasswordIcon: () {
                      controller.showAndHidePassword();
                    },
                    validator: (val) {
                      return validInput(val!, 8, 50, "password");
                    },
                    controllerTextFiled: controller.password,
                    hintText: "Enter Your Password",
                    prefixIcon: Icons.lock_outline,
                  )),
              GetBuilder<ResetPasswordControllerImp>(
                  builder: (controller) => CustomTextFormFieldAuth(
                    obscureText: controller.passwordIsShow,
                    isPassword: true,
                    onPressedPasswordIcon: () {
                      controller.showAndHidePassword();
                    },
                    validator: (val) {
                      return validInput(val!, 8, 50, "password");
                    },
                    controllerTextFiled: controller.rePassword,
                    hintText: "Re Enter Your Password",
                    prefixIcon: Icons.lock_outline,
                  )),

              //  CustomTextFormFieldAuth(
              //   validator: (val ) {  },
              //   hintText: "Re Enter Your Password",
              //   prefixIcon: Icons.lock_outline,
              //   controllerTextFiled: controller.rePassword,
              // ),
              const Spacer(
                flex: 1,
              ),
              CustomButtonAuth(
                onPressed: () {
                    controller.goToSuccessResetPassword();

                },
                text: "Save",
              ),
              const Spacer(
                flex: 15,
              ),
            ],
          ),
        ));
  }
}
