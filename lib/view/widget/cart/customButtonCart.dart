import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonCart extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonCart({super.key, required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5.0),height: 40,
      // padding: const EdgeInsets.symmetric(horizontal: 16.0),
      width: double.infinity,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 0),
        textColor: Colors.white,
        onPressed: onPressed,color: AppColor.primaryColor,
        child:   Text(text),
      ),

    );
  }
}
