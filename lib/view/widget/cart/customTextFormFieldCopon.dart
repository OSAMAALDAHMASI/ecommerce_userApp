import 'package:flutter/material.dart';

class CustomTextFormFieldCoupon extends StatelessWidget {
  final TextEditingController myController;
  final String hintText;
  const CustomTextFormFieldCoupon({super.key, required this.myController, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration:    InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
        border: const OutlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hintText,
        hintStyle:  const TextStyle(fontSize: 14.0, ),
      ),
    );
  }
}
