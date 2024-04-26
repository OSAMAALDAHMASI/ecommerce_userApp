import 'package:ecommerce/controller/address/addressDetailsController.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../core/function/validtionTextFiled.dart';
import '../../widget/address/customButtonAddAddress.dart';
import '../../widget/address/customTextFormFieldAddress.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddressDetailsControllerImp controller =
        Get.put(AddressDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: CustomButtonAddress(
        onPressed: ()async {
        await  controller.addAddress();
        },
        text: 'Save',
      ),
      appBar: AppBar(
        title: const Text("Address"),
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: GetBuilder<AddressDetailsControllerImp>(builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest, widget: Column(
          children: [
            if(controller.kGooglePlex!=null) Expanded(
             flex: 3,
              child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: controller.kGooglePlex!,
                  markers: controller.marker.toSet(),
                  onTap: (latLng){
                    controller.addMarker(latLng);
                  },
                  onMapCreated: (GoogleMapController controller2) {
                    controller.controllerMap.complete(controller2);
                  }),
            ),
            SizedBox(
                height: Get.height / 2.5,
                child: Form(
                  key: controller.formState,
                  child: Column(
                    children: [
                      CustomTextFormFieldAddressDetails(
                        validator: (val) {
                          return validInput(val!, 0, 0,"address");
                        },
                        hintText: 'Name',
                        myController: controller.nameController,
                      ),
                      CustomTextFormFieldAddressDetails(
                        hintText: 'Phone',
                        myController: controller.phoneController,
                        keyboardType: TextInputType.phone,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextFormFieldAddressDetails(
                            validator: (val) {
                              return validInput(val!, 0, 0, "address");
                            },
                            hintText: 'City',
                            myController: controller.cityController,
                            fullSize: false,
                          ),
                          const SizedBox(
                            width: 12.0,
                          ),
                          CustomTextFormFieldAddressDetails(
                            validator: (val) {
                              return validInput(val!, 0, 0, "address");
                            },
                            hintText: 'Street',
                            myController: controller.streetController,
                            fullSize: false,
                          ),
                        ],
                      ),
                      const Spacer(),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              controller.addressType.length,
                                  (index) => GetBuilder<AddressDetailsControllerImp>(
                                  builder: (controller) => SizedBox(
                                    height: 60,
                                    width: 120,
                                    child: InkWell(
                                      onTap: () {
                                        controller.changeSelectedAddressType(
                                            controller.addressType[index]
                                            ['name']);
                                      },
                                      child: Card(
                                        color: controller
                                            .selectedAddressType ==
                                            controller.addressType[index]
                                            ['name']
                                            ? AppColor.primaryColor
                                            : null,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                controller.addressType[index]
                                                ['icon'],
                                                color: controller
                                                    .selectedAddressType ==
                                                    controller
                                                        .addressType[
                                                    index]['name']
                                                    ? Colors.white
                                                    : null,
                                                size: 25.0,
                                              ),
                                              const Spacer(),
                                              Text(
                                                  controller
                                                      .addressType[index]
                                                  ['name'],
                                                  style: TextStyle(
                                                      color: controller
                                                          .selectedAddressType ==
                                                          controller.addressType[
                                                          index]
                                                          ['name']
                                                          ? Colors.white
                                                          : null,
                                                      fontWeight: controller
                                                          .selectedAddressType ==
                                                          controller.addressType[
                                                          index]
                                                          ['name']
                                                          ? FontWeight.bold
                                                          : null)),
                                              const Spacer(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ))),
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ))),
      ),
    );
  }
}
