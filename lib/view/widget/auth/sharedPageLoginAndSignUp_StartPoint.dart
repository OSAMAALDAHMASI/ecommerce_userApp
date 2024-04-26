import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';
import 'customTitleAuth.dart';

class MySharedPage extends StatelessWidget {
  final Widget child;
  final String title;
  final bool? allowMove;
  const MySharedPage({super.key, required this.child, required this.title, this.allowMove});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isKeyBord = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: Locale == const Locale("en") ? 0 : null,
              right: Locale == const Locale("ar") ? 0 : null,
              child:
              Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).padding.top,
                      right: MediaQuery.of(context).padding.top,
                      top: MediaQuery.of(context).padding.top),
                  child: CustomTextTitleAuth(
                    text: title,
                  )),
              
            ),
            Positioned(
              bottom: !isKeyBord|| allowMove==false ?0: null ,
              child: Container(
                width: screenWidth,
                height: screenHeight / 10 * 7,
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                decoration: const BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100.0),
                        topRight: Radius.circular(100.0))),
                child: child,
              ),
            )
          ],
        ),
      ),
    );
  }
}
