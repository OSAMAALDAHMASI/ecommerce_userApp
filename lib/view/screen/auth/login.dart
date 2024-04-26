// import 'package:ecommerce/core/constant/color.dart';
// import 'package:ecommerce/view/widget/auth/customTextToSignUpAndSignIn.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../controller/auth/loginController.dart';
// import '../../widget/auth/customButtonAuth.dart';
// import '../../widget/auth/customTextBodyAuth.dart';
// import '../../widget/auth/customTextFormFiledAuth.dart';
// import '../../widget/auth/customTitleAuth.dart';
// import '../../widget/auth/logo.dart';
//
// class Login extends StatelessWidget {
//   const Login({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     LoginControllerImp controller = Get.put(LoginControllerImp());
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "9".tr,
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
//           const LogoAuth(),
//           const SizedBox(
//             height: 20.0,
//           ),
//            CustomTextTitleAuth(text: "10".tr),
//           const SizedBox(
//             height: 10.0,
//           ),
//            CustomTextBodyAuth(
//               text:
//                   "11".tr),
//           const SizedBox(
//             height: 30.0,
//           ),
//           CustomTextFormFieldAuth(
//             hintText: "12".tr,
//             labelText: "13".tr,
//             suffixIcon: Icons.email_outlined,
//             controllerTextFiled: controller.email,
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
//           CustomButtonAuth(text: "17".tr, onPressed: () {}),
//           const SizedBox(
//             height: 30.0,
//           ),
//           CustomTextToSignUpOrSignIn(
//             textOne: "18".tr,
//             textTwo: "19".tr,
//             onTap: () {
//               controller.goToSignUp();
//             },
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/function/appExitAlert.dart';
import 'package:ecommerce/view/widget/auth/customButtonAuth.dart';
import 'package:ecommerce/view/widget/auth/customTextBodyAuth.dart';
import 'package:ecommerce/view/widget/auth/customTextPageName.dart';
import 'package:ecommerce/view/widget/auth/sharedPageLoginAndSignUp_StartPoint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/loginController.dart';
import '../../../core/function/validtionTextFiled.dart';
import '../../widget/auth/customTextFormFiledAuth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandlingDataViewRequest(
            statusRequest: controller.statusRequest,
            widget: MySharedPage(
                title: "10".tr,
                child: Form(
                  key: controller.formState,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextPageName(text: "9".tr),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextBodyAuth(text: "11".tr),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextFormFieldAuth(
                        hintText: "12".tr,
                        prefixIcon: Icons.email_outlined,
                        controllerTextFiled: controller.email,
                        validator: (val) {
                          return validInput(val!, 10, 100, "email");
                        },
                      ),
                      GetBuilder<LoginControllerImp>(
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
                      const SizedBox(
                        height: 4,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: InkWell(
                          onTap: () {
                            controller.goToForgetPassword();
                          },
                          child: Text(
                            "16".tr,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                fontSize: 16.0, color: AppColor.blue700),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomButtonAuth(
                        onPressed: () {
                          controller.login();
                        },
                        text: "9".tr,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomButtonAuth(
                        onPressed: () {
                          controller.goToSignUp();
                        },
                        text: "19".tr,
                        textColor: AppColor.blue800,
                        buttonColor: AppColor.white,
                      ),
                      const Spacer(
                        flex: 7,
                      ),
                    ],
                  ),
                )),
          ),
        ));
  }
}

//
// import 'package:ecommerce/controller/auth/loginController.dart';
// import 'package:ecommerce/core/class/handlingdataview.dart';
// import 'package:ecommerce/core/constant/color.dart';
// import 'package:ecommerce/core/function/appExitAlert.dart';
// import 'package:ecommerce/core/function/validtionTextFiled.dart';
// import 'package:ecommerce/view/widget/auth/copy/custombuttonauth.dart';
// import 'package:ecommerce/view/widget/auth/copy/customtextformauth.dart';
// import 'package:ecommerce/view/widget/auth/copy/textsignup.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_utils/get_utils.dart';
//
// import '../../widget/auth/customTextBodyAuth.dart';
// import '../../widget/auth/customTitleAuth.dart';
// import '../../widget/auth/logo.dart';
//
// class Login extends StatelessWidget {
//   const Login({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(LoginControllerImp());
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: AppColor.white,
//         elevation: 0.0,
//         title: Text('Sign In',
//             style: Theme.of(context)
//                 .textTheme
//                 .headline1!
//                 .copyWith(color: AppColor.grey)),
//       ),
//       body: WillPopScope(
//           onWillPop: alertExitApp,
//           child: GetBuilder<LoginControllerImp>(
//             builder: (controller) => HandlingDataView(
//                 statusRequest: controller.statusRequest,
//                 widget: Container(
//                   padding:
//                   const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//                   child: Form(
//                     key: controller.formState,
//                     child: ListView(children: [
//                       const LogoAuth(),
//                       const SizedBox(height: 20),
//                       CustomTextTitleAuth(text: "10".tr),
//                       const SizedBox(height: 10),
//                       CustomTextBodyAuth(text: "11".tr),
//                       const SizedBox(height: 15),
//                       CustomTextFormAuth(
//                         isNumber: false,
//
//                         valid: (val) {
//                           return validInput(val!, 5, 100, "email");
//                         },
//                         mycontroller: controller.email,
//                         hinttext: "12".tr,
//                         iconData: Icons.email_outlined,
//                         labeltext: "18".tr,
//                         // mycontroller: ,
//                       ),
//                       GetBuilder<LoginControllerImp>(
//                         builder: (controller) => CustomTextFormAuth(
//                           obscureText: controller.passwordIsShow,
//                           onTapIcon: () {
//                             controller.showAndHidePassword();
//                           },
//                           isNumber: false,
//                           valid: (val) {
//                             return validInput(val!, 3, 30, "password");
//                           },
//                           mycontroller: controller.password,
//                           hinttext: "13".tr,
//                           iconData: Icons.lock_outline,
//                           labeltext: "19".tr,
//                           // mycontroller: ,
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           controller.goToForgetPassword();
//                         },
//                         child: Text(
//                           "14".tr,
//                           textAlign: TextAlign.right,
//                         ),
//                       ),
//                       CustomButtomAuth(
//                           text: "15".tr,
//                           onPressed: () {
//                             controller.login();
//                           }),
//                       const SizedBox(height: 40),
//                       CustomTextSignUpOrSignIn(
//                         textone: "16".tr,
//                         texttwo: "17".tr,
//                         onTap: () {
//                           controller.goToSignUp();
//                         },
//                       )
//                     ]),
//                   ),
//                 )),
//           )),
//     );
//   }
// }