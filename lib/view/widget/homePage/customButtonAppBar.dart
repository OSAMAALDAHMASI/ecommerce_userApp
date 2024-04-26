import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final IconData? iconData;
  final String text;
  final bool selected;

  const CustomButtonAppBar(
      {super.key,
      this.onPressed,
      this.iconData,
      required this.text,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: MaterialButton(
        onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FittedBox(child: Icon(iconData,color: selected==true?AppColor.primaryColor:AppColor.blue900,)),
            // FittedBox(child: Text(text,style: TextStyle(color: selected==true?AppColor.primaryColor:AppColor.blue900),)),
          ],
        ),
      ),
    );
  }
}
