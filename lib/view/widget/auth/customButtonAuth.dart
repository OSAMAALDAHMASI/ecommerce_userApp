import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color? buttonColor;
  final Color? textColor;

  const CustomButtonAuth(
      {super.key,
      required this.onPressed,
      required this.text,
      this.buttonColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    final screenWidth =MediaQuery.of(context).size.width;
    return Container(
      margin:  EdgeInsets.only(top: screenWidth*0.02// 10.0
      ),
      child: MaterialButton(
        // height: 64.0,
        padding:  EdgeInsets.symmetric(vertical:screenWidth*0.03// 12.0
        ),
        minWidth: MediaQuery.of(context).size.width,
        shape: RoundedRectangleBorder(
            // side: BorderSide.lerp(BorderSide(color: Colors.black), BorderSide(color: Colors.black), BorderSide(color: Colors.black)),
            borderRadius: BorderRadius.circular(126.0)),
        color: buttonColor ?? AppColor.primaryColor,
        textColor: textColor ?? Colors.white,
        onPressed: onPressed,
        child: FittedBox(
          child: Text(
            text,textScaleFactor:1.0 ,
            textAlign: TextAlign.center,
            style:  TextStyle(
              fontSize:screenWidth*0.0420 //20.0
              ,
            ),
          ),
        ),
      ),
    );
  }
}
