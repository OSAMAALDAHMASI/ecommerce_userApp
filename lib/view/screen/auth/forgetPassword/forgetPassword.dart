import 'package:ecommerce/view/widget/auth/customButtonAuth.dart';
import 'package:ecommerce/view/widget/auth/customTextBodyAuth.dart';
import 'package:ecommerce/view/widget/auth/customTextPageName.dart';
import 'package:ecommerce/view/widget/auth/sharedPageLoginAndSignUp_StartPoint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/forgepassword/forgetPasswordController.dart';
import '../../../widget/auth/customTextFormFiledAuth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return MySharedPage(
        title: "Forget Password",
        child: Form(
          key: controller.formState,
          child: Column(
            children: [
              const SizedBox(height: 16,),
              const CustomTextPageName(text: "Chack Email"),
              const SizedBox(height: 16,),
              const CustomTextBodyAuth(
                  text: "Enter Your Email To Reset Your Password"),
              const SizedBox(height: 16,),
              CustomTextFormFieldAuth(
                validator: (val ) {  },
                hintText: "12".tr,
                prefixIcon: Icons.email_outlined,
                controllerTextFiled: controller.email,
              ),
              const SizedBox(height: 32,),
              CustomButtonAuth(
                onPressed: () {
                  controller.checkEmail();
                },
                text: "Check",
              ),
            ],
          ),
        ));
  }
}
