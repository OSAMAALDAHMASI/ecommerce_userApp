import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String text;
  const CustomTextBodyAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Text(
      text,
      textAlign: TextAlign.center,
      textScaleFactor:0.90 ,
      style: TextStyle(fontSize:screenWidth*0.048 //16.0
          , color: AppColor.blue700),
    );
  }
}
