import 'package:ecommerce/controller/cartController.dart';
import 'package:ecommerce/view/widget/cart/customTextFormFieldCopon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import 'customButtonCart.dart';
import 'customButtonCopon.dart';

class CustomButtomNavgationBarCart extends StatelessWidget {
  const CustomButtomNavgationBarCart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(builder: (controller)=>Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        controller.couponName!=null?Center(child: Text("Coupon Code : ${controller.couponName}")): Container(
          // margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: CustomTextFormFieldCoupon(
                      myController: controller.couponController,
                      hintText: "Coupon Code")),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                  flex: 1,
                  child: CustomButtonCoupon(
                    text: "Apply",
                    onPressed: () {
                      controller.applyCoupon();
                    },
                  )),
            ],
          ),

        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.primaryColor),
              borderRadius: BorderRadius.circular(12.0)),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
          child: GetBuilder<CartControllerImp>(
              builder: (controller) => Column(
                children: [
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Price",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: AppColor.blue900),
                      ),
                      controller.priceOrders !=
                          controller.priceOrdersWithDiscount
                          ? Row(
                        children: [
                          Text(
                            "${controller.priceOrders}\$",
                            style: const TextStyle(
                                decoration: TextDecoration
                                    .lineThrough,
                                color: AppColor.blue900,
                                fontSize: 17.0),
                          ),
                          const SizedBox(
                            width: 12.0,
                          ),
                          Text(
                            "${controller.priceOrdersWithDiscount}\$",
                            style: const TextStyle(
                                color: AppColor.red,
                                fontSize: 17.0),
                          ),
                        ],
                      )
                          : Text(
                        "${controller.priceOrdersWithDiscount}\$",
                        style: const TextStyle(
                            color: AppColor.red,
                            fontSize: 17.0),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Coupon Discount",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: AppColor.blue900),
                      ),
                      Text(
                        "${controller.couponDiscount} %",
                        style: const TextStyle(
                            fontSize: 18.0,
                            color: AppColor.blue900),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shipping",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: AppColor.blue900),
                      ),
                      Text(
                        "0\$",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: AppColor.blue900),
                      ),
                    ],
                  ),
                  const Divider(
                    color: AppColor.primaryColor,
                  ),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Price",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: AppColor.blue900,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${controller.totalPriceWithCouponDiscount ?? controller.priceOrdersWithDiscount}\$",
                        style: const TextStyle(
                            fontSize: 18.0,
                            color: AppColor.blue900,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              )),
        ),
         CustomButtonCart(text: "Order", onPressed: () {controller.goToCheckoutPage();  },)
      ],
    ));
  }
}
