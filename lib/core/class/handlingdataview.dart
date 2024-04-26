import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/view/widget/auth/sharedPageLoginAndSignUp_StartPoint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? SizedBox(
      height: Get.width,
          child: Center(
              child: Lottie.asset(
              "assets/lottie/cart2.json",
              width: 250,
              height: 250,
            )),
        )
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: Lottie.asset(
                "assets/lottie/offline2.json",
                width: 250,
                height: 250,
              ))
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Lottie.asset(
                    "assets/lottie/server.json",
                    width: 250,
                    height: 250,
                  ))
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(
                        "assets/lottie/noData.json",
                        width: 250,
                        height: 250,
                      ))
                    : widget;
  }
}

class HandlingDataViewRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataViewRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? MySharedPage(
            title: "Loading . . . ",
            child: Center(
                child: Lottie.asset(
              "assets/lottie/cart2.json",
              width: 250,
              height: 250,
            )))
        : statusRequest == StatusRequest.offlineFailure
            ? MySharedPage(
                title: "Loaging . . . ",
                child: Center(
                    child: Lottie.asset(
                  "assets/lottie/offline2.json",
                  width: 500,
                  height: 500,
                )))
            : statusRequest == StatusRequest.serverFailure
                ? MySharedPage(
                    title: "Loading . . . ",
                    child: Center(
                        child: Lottie.asset(
                      "assets/lottie/server.json",
                      width: 250,
                      height: 250,
                    )))
                : widget;
  }
}


