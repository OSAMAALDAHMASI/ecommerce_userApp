import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomCardPaymentMethod extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final bool isActive;
  const CustomCardPaymentMethod({super.key,required this.onTap, required this.text, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:onTap ,
      child: Card(
        color: isActive?AppColor.primaryColor:null,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
            child: Text(text,style: TextStyle(color:isActive?Colors.white:AppColor.primaryColor ,fontWeight: FontWeight.bold),)),),
    );
  }
}
