import 'package:ecommerce/controller/homePageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends GetView<HomePageControllerImp> {
  final String hintText;
 final void Function() onPressedIconNotification;
 final void Function() onPressedIconFavorite;

  const CustomAppBar({super.key, required this.hintText, required this.onPressedIconNotification, required this.onPressedIconFavorite});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
                onChanged: (val){
                 controller. cheackOnSearch(val);
                },
                controller: controller.searchTextFiledController,
                decoration: InputDecoration(
                  prefixIcon:  IconButton( onPressed: () {controller.search(controller.searchTextFiledController!.text);  }, icon: Icon(Icons.search),),
                  hintText: hintText,
                  hintStyle: const TextStyle(fontSize: 18),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              )),

          const SizedBox(
            width: 10,
          ),
          // Container(
          //   decoration: BoxDecoration(
          //       color: Colors.grey[200],
          //       borderRadius: BorderRadius.circular(10)),
          //   width: 60,
          //   padding: const EdgeInsets.symmetric(vertical: 7),
          //   child: IconButton(
          //     onPressed: onPressedIconNotification,
          //     icon: Icon(
          //       Icons.notifications_active_outlined,
          //       size: 30,
          //       color: Colors.grey[600],
          //     ),
          //   ),
          // ),

          // const SizedBox(
          //   width: 10,
          // ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            width: 60,
            padding: const EdgeInsets.symmetric(vertical:15.0),
            child: IconButton(
              onPressed: onPressedIconFavorite,
              icon: Icon(
                Icons.favorite_outline,
                size: 30,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
