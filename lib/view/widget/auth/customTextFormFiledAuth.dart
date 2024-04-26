import 'package:flutter/material.dart';

class CustomTextFormFieldAuth extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController? controllerTextFiled;
  final TextInputType? keyboardType;
 final String? Function(String?)? validator;
 final bool? isPassword;
  final void Function()?onPressedPasswordIcon;
 final bool? obscureText;

  const CustomTextFormFieldAuth(
      {super.key,
      required this.prefixIcon,
      required this.hintText,
       this.controllerTextFiled,required this.validator, this.keyboardType, this.isPassword, this.onPressedPasswordIcon, this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(validator:validator,
        controller:controllerTextFiled ,
        obscureText:obscureText==true?true:false ,
        keyboardType:keyboardType??TextInputType.text,
        decoration:  InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14.0, ),
          prefixIcon: Icon(prefixIcon),
          suffixIcon:isPassword==true? IconButton(icon:  Icon(obscureText==false?Icons.visibility_outlined:Icons.visibility_off_outlined), onPressed: onPressedPasswordIcon,):null,
          // contentPadding:
          // const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
        ),

      ),
    );
  }
}
