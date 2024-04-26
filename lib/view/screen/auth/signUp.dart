// import 'package:ecommerce/controller/auth/signUpController.dart';
// import 'package:ecommerce/core/constant/color.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../widget/auth/customButtonAuth.dart';
// import '../../widget/auth/customTextBodyAuth.dart';
// import '../../widget/auth/customTextFormFiledAuth.dart';
// import '../../widget/auth/customTextToSignUpAndSignIn.dart';
// import '../../widget/auth/customTitleAuth.dart';
//
// class SignUp extends StatelessWidget {
//   const SignUp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     SignUpControllerImp controller = Get.put(SignUpControllerImp());
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "19".tr,
//           style: Theme.of(context)
//               .textTheme
//               .displayLarge
//               ?.copyWith(color: AppColor.grey),
//         ),
//         centerTitle: true,
//         backgroundColor: AppColor.backgroundColor,
//         elevation: 0.0,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.symmetric(horizontal: 30),
//         children: [
//           const SizedBox(
//             height: 10.0,
//           ),
//           const SizedBox(
//             height: 20.0,
//           ),
//            CustomTextTitleAuth(text: "20".tr),
//           const SizedBox(
//             height: 10.0,
//           ),
//            CustomTextBodyAuth(
//               text:
//                   "21".tr),
//           const SizedBox(
//             height: 30.0,
//           ),
//           CustomTextFormFieldAuth(
//             controllerTextFiled: controller.userName,
//             hintText: "22".tr,
//             labelText: "23".tr,
//             suffixIcon: Icons.person_outline,
//           ),
//           CustomTextFormFieldAuth(
//             controllerTextFiled: controller.email,
//             hintText: "12".tr,
//             labelText: "13".tr,
//             suffixIcon: Icons.email_outlined,
//           ),
//           CustomTextFormFieldAuth(
//             controllerTextFiled: controller.phone,
//             hintText: "24".tr,
//             labelText: "25".tr,
//             suffixIcon: Icons.phone_android_outlined,
//           ),
//           CustomTextFormFieldAuth(
//             controllerTextFiled: controller.password,
//             hintText: "14".tr,
//             labelText: "15".tr,
//             suffixIcon: Icons.lock_outline,
//           ),
//            Text(
//             "16".tr,
//             textAlign: TextAlign.end,
//           ),
//           CustomButtonAuth(text: "9".tr, onPressed: () {}),
//           const SizedBox(
//             height: 30.0,
//           ),
//           CustomTextToSignUpOrSignIn(
//             textOne: "26".tr,
//             textTwo: "9".tr,
//             onTap: () {
//               controller.goToLogin();
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/function/validtionTextFiled.dart';
import 'package:ecommerce/view/widget/auth/customButtonAuth.dart';
import 'package:ecommerce/view/widget/auth/customTextBodyAuth.dart';
import 'package:ecommerce/view/widget/auth/customTextPageName.dart';
import 'package:ecommerce/view/widget/auth/sharedPageLoginAndSignUp_StartPoint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signUpController.dart';
import '../../widget/auth/customTextFormFiledAuth.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    // SignUpControllerImp controller=
    Get.put(SignUpControllerImp());

    return  GetBuilder<SignUpControllerImp>(builder: (controller)=>
    controller.statusRequest==StatusRequest.loading?const MySharedPage(title: 'Loading . . .',
    child: Center(child: Text("Loading....."), )):
        MySharedPage(
        title: "27".tr,
        child: Form(
          key: controller.formState,
          child:ListView(
            children: [
              const SizedBox(
                height: 16,
              ),
              CustomTextPageName(text: "19".tr),
              const SizedBox(
                height: 16,
              ),
              CustomTextBodyAuth(text: "21".tr),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormFieldAuth(
                validator: (val) {
                  return validInput(val!, 3, 20, "userName");
                },
                hintText: "22".tr,
                prefixIcon: Icons.person_outline,
                controllerTextFiled: controller.userName,
              ),
              CustomTextFormFieldAuth(
                validator: (val) {
                  return validInput(val!, 10, 100, "email");
                },
                hintText: "12".tr,
                prefixIcon: Icons.email_outlined,
                controllerTextFiled: controller.email,
              ),
              CustomTextFormFieldAuth(
                keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
                validator: (val) {
                  return validInput(val!, 5, 15, "phone");
                },
                controllerTextFiled: controller.phone,
                hintText: "24".tr,
                prefixIcon: Icons.phone_android_outlined,
              ),
              GetBuilder<SignUpControllerImp>(
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
                    hintText: "14".tr,
                    prefixIcon: Icons.lock_outline,
                  )),
              CustomButtonAuth(
                onPressed: () {
                  controller.signUp();
                },
                text: "19".tr,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButtonAuth(
                onPressed: () {
                  controller.goToLogin();
                },
                text: "9".tr,
                textColor: AppColor.blue800,
                buttonColor: AppColor.white,
              ),
            ],
          )),
        ))

    ;
  }
}
