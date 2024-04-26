import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomTextFormFieldAddressDetails extends StatelessWidget {
final bool? fullSize;
final TextEditingController? myController;
final String hintText;
final TextInputType? keyboardType;
final String? Function(String?)? validator;
  const CustomTextFormFieldAddressDetails({super.key, this.fullSize=true,  this.myController, required this.hintText, this.keyboardType=TextInputType.text, this.validator});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:fullSize==false?(Get.width/2)-22.0:null,
      child: TextFormField(
        validator:validator ,
        controller: myController,
        keyboardType:keyboardType,
        decoration:   InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14.0, ),
        ),

      ),
    );
  }
}
