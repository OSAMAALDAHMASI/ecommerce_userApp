import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String text;
  const CustomTextTitleAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return  FittedBox(
        child: Text(
          text,textAlign: TextAlign.center,
          textScaleFactor:1.0 ,
          style:  TextStyle(fontSize: screenWidth*0.08, color: AppColor.blue50),
        ));

    //
    //   Text(
    //   text,
    //   textAlign: TextAlign.center,
    //   style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize:24.0 ),
    // );
  }
}
