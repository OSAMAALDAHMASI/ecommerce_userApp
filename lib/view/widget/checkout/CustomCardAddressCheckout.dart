import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomCardAddressCheckout extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final String subTitle;
  final String trailingText;
  final bool isActive;
  const CustomCardAddressCheckout({super.key, this.onTap, required this.title, required this.subTitle, required this.trailingText, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap,
      child: Card(
        color: isActive?AppColor.primaryColor:null,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: ListTile(
          title: Text(title,style:  TextStyle(color:isActive?Colors.white: AppColor.primaryColor)),
          subtitle: Text(subTitle,style:  TextStyle(color:isActive?Colors.white: AppColor.primaryColor)),
          leading:  Icon(Icons.location_city_outlined,color:isActive?Colors.white: AppColor.primaryColor,),
          trailing: FittedBox(
            child:  Text(trailingText,style:  TextStyle(color:isActive?Colors.white: AppColor.primaryColor),),
          ),
        ),
      ),
    );
  }
}
