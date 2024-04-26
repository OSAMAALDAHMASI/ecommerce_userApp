import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';


class CustomCardDeliveryType extends StatelessWidget {
 final String imageName;
 final String text;
 final bool isActive;
 final void Function()? onTap;
  const CustomCardDeliveryType({super.key, required this.imageName, required this.text, required this.isActive,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Card(
        color:!isActive?null:AppColor.primaryColor ,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          height: 100,
          width: 100,
          margin: EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Image.asset(imageName,color: isActive?Colors.white:null,fit: BoxFit.fill,)),
              Expanded(
                  flex: 1,
                  child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,color: isActive?Colors.white:null),)),
            ],
          ),

        ),),
    );
  }
}
