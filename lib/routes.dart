import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/middleware/myMiddleWare.dart';
import 'package:ecommerce/view/screen/address/address.dart';
import 'package:ecommerce/view/screen/address/addressDetails.dart';
import 'package:ecommerce/view/screen/auth/forgetPassword/resetPassword.dart';
import 'package:ecommerce/view/screen/auth/forgetPassword/verifyCodeForgetPassword.dart';
import 'package:ecommerce/view/screen/cartPage.dart';
import 'package:ecommerce/view/screen/checkout.dart';
import 'package:ecommerce/view/screen/items.dart';
import 'package:ecommerce/view/screen/itemsDetailsPage.dart';
import 'package:ecommerce/view/screen/language.dart';
import 'package:ecommerce/view/screen/myFavorite.dart';
import 'package:ecommerce/view/screen/onboarding.dart';
import 'package:ecommerce/view/screen/orders/archive.dart';
import 'package:ecommerce/view/screen/orders/orderDetails.dart';
import 'package:ecommerce/view/screen/orders/pending.dart';
import 'package:ecommerce/view/screen/setting.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'view/screen/auth/forgetPassword/forgetPassword.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/auth/signUp.dart';
import 'view/screen/auth/successSignUp.dart';
import 'view/screen/auth/verifyCodeSignUp.dart';
import 'view/screen/mainHomePage.dart';

List<GetPage<dynamic>>? routes = [
  //OnBoarding
  GetPage(name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  // GetPage(name: "/", page: ()=>const TestView()),
  // GetPage(name: "/", page: ()=>const Cart()),

  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  //Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(
      name: AppRoute.verificationCodeForgetPassword,
      page: () => const VerificationCodeForgetPassword()),
  GetPage(
      name: AppRoute.verificationCodeSignUp,
      page: () => const VerificationCodeSignUp()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  // GetPage(name: AppRoute.homePage, page: ()=>const HomePage()),
  GetPage(name: AppRoute.homePage, page: () => const MainHomePage()),
  GetPage(name: AppRoute.itemsPage, page: () => const Items()),
  GetPage(name: AppRoute.itemsDetailsPage, page: () => const ItemsDetailsPage()),
  GetPage(name: AppRoute.myFavoritePage, page: () => const MyFavorite()),
  GetPage(name: AppRoute.settingPage, page: () => const SettingPage()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  GetPage(name: AppRoute.addressPage, page: () => const AddressPage()),
  GetPage(name: AppRoute.addressDetails, page: () => const AddressDetails()),
  GetPage(name: AppRoute.checkoutPage, page: () => const CheckoutPage()),
  GetPage(name: AppRoute.orderPending, page: () => const Pending()),
  GetPage(name: AppRoute.orderDetails, page: () => const OrderDetails()),
  GetPage(name: AppRoute.orderArchive, page: () => const Archive()),
];
