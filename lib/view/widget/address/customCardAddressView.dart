import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomCardAddressView extends StatelessWidget {
  final void Function()? onTap;
  final void Function()? onPressedDelete;
  final String title;
  final String subtitle;
  final String type;
  const CustomCardAddressView({super.key,required this.onTap, required this.title, required this.subtitle, required this.type,required this.onPressedDelete});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Card(
          child: ListTile(
              title: Text(title,style: const TextStyle(color: AppColor.blue800)),
              subtitle: Text(subtitle,style: const TextStyle(color: AppColor.blue800)),
              leading: const Icon(Icons.location_city_outlined,color: AppColor.primaryColor,),
          trailing: FittedBox(
            child: Row(
              children: [
                Text(type,style: const TextStyle(color: AppColor.blue800),),
                IconButton(onPressed: onPressedDelete, icon: const Icon(Icons.delete_outline,color: Colors.red,))
              ],
            ),
          ),
          ),
        ));
  }
}
