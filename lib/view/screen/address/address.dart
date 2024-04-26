import 'package:ecommerce/controller/address/addressController.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/view/widget/address/customCardAddressView.dart';
import 'package:ecommerce/view/widget/onBoarding/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/address/customButtonAddAddress.dart';
import '../../widget/cart/customButtonCart.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    AddressControllerImp controller= Get.put(AddressControllerImp());
    return Scaffold(
      bottomNavigationBar: InkWell(child: CustomButtonAddress(text: "Add a New Address", onPressed: () {

        controller.goToAddressDetailsPage();
      },)),
      appBar: AppBar(title: const Text("Address"),leading: IconButton(icon: Icon(Icons.arrow_back_outlined), onPressed: () {Get.back();  },)),
body: Container(
  margin: const EdgeInsets.all(16.0),
  child: GetBuilder<AddressControllerImp>(builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest,widget: ListView.builder(
      itemCount: controller.data.length,
      itemBuilder: (BuildContext context,int index)=>CustomCardAddressView(title: controller.data[index].addressName!, subtitle:  "${controller.data[index].addressCity!}-${controller.data[index].addressStreet!}", type: controller.data[index].addressType!, onTap: () {  }, onPressedDelete: () { controller.deleteAddress(controller.data[index].addressId!); },)),)),

),

    );
  }
}
