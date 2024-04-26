import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonCoupon extends StatelessWidget {
  final String text;
 final void Function()? onPressed;
  const CustomButtonCoupon({super.key, required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      textColor: Colors.white,
      onPressed: onPressed,color: AppColor.primaryColor,
      child:   Text(text),
    );
  }
}
