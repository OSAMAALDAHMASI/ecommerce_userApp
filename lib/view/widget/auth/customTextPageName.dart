import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class CustomTextPageName extends StatelessWidget {
  final String text;

  const CustomTextPageName({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final screenWidth =MediaQuery.of(context).size.width;
    return Text(
      text,
      textScaleFactor: 1.0,
      textAlign: TextAlign.center,
      style:  TextStyle(fontSize: screenWidth*0.09, color: AppColor.blue800),
    );
  }
}
