import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class CustomButtonLang extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const CustomButtonLang({super.key, required this.textButton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      minWidth:MediaQuery.of(context).size.width *0.7 ,
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      color: AppColor.primaryColor,
      onPressed: onPressed,child:   Text(textButton,style: const TextStyle(color: Colors.white),),);
  }
}
