import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class CustomTitleHome extends StatelessWidget {
  final String textTitle;

  const CustomTitleHome({super.key, required this.textTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        textTitle,
        style: const TextStyle(
            fontSize: 20.0,
            color: AppColor.primaryColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
