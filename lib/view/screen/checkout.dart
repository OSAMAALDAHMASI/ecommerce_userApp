import 'package:ecommerce/controller/checkoutController.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/imageAssets.dart';
import 'package:ecommerce/view/widget/checkout/CustomCardAddressCheckout.dart';
import 'package:ecommerce/view/widget/checkout/customCardDeliveryType.dart';
import 'package:ecommerce/view/widget/checkout/customCardPaymentMethod.dart';
import 'package:ecommerce/view/widget/checkout/customtextCheckout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutControllerImp controller = Get.put(CheckoutControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 5.0),
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        width: double.infinity,
        child: MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
          textColor: Colors.white,
          onPressed: () {
            controller.checkout();
          },
          color: AppColor.primaryColor,
          child: const Text(
            "CheckOut",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: GetBuilder<CheckoutControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                margin:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0),
                child: ListView(
                  children: [
                    const CustomTextCheckout(text: "Choose Payment Method"),
                    CustomCardPaymentMethod(
                      onTap: () {
                        controller.choosePaymentMethod("0");
                      },
                      text: "Cash On Delivery",
                      isActive:
                          controller.paymentMethod == "0" ? true : false,
                    ),
                    CustomCardPaymentMethod(
                      onTap: () {
                        controller.choosePaymentMethod("1");
                      },
                      text: "Payment Cards",
                      isActive:
                          controller.paymentMethod == "1" ? true : false,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    const CustomTextCheckout(text: "Choose Delivery Type"),
                    Row(
                      children: [
                        CustomCardDeliveryType(
                            imageName: AppImageAssets.delivery,
                            text: "Delivery",
                            isActive: controller.deliveryType == "1"
                                ? true
                                : false,
                            onTap: () {
                              controller.chooseDeliveryType("1");
                            }),
                        CustomCardDeliveryType(
                            imageName: AppImageAssets.driveThru,
                            text: "driveThru",
                            isActive: controller.deliveryType == "0"
                                ? true
                                : false,
                            onTap: () {
                              controller.chooseDeliveryType("0");
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    if (controller.deliveryType == "1")
                      const CustomTextCheckout(text: "Shipping Address"),
                    const SizedBox(
                      height: 16.0,
                    ),
                    if (controller.deliveryType == "1")
                      ...List.generate(
                          controller.data.length,
                          (index) => CustomCardAddressCheckout(
                                onTap: () {
                                  controller.chooseShippingAddress(
                                      "${controller.data[index].addressId}");
                                },
                                title: "${controller.data[index].addressName}",
                                subTitle:
                                    "${controller.data[index].addressCity}-${controller.data[index].addressStreet}",
                                trailingText:
                                    "${controller.data[index].addressType}",
                                isActive: controller.shippingAddressId ==
                                        controller.data[index].addressId
                                    ? true
                                    : false,
                              )),
                  ],
                ),
              ))),
    );
  }
}
