import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextCheckout extends StatelessWidget {
  final String text;
  const CustomTextCheckout({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Text(text,style:
    const TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: AppColor.blue800),);
  }
}
