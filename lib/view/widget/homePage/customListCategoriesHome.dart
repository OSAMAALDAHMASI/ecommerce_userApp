import 'package:ecommerce/core/function/translateData.dart';
import 'package:ecommerce/data/model/categoriesModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/homePageController.dart';
import '../../../core/constant/color.dart';
import '../../../linkApi.dart';

class CustomListCategoriesHome extends GetView<HomePageControllerImp> {
  const CustomListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 108.0,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 16,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return Categories(
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index]),
              i: index);
        },
      ),
    );
  }
}

class Categories extends GetView<HomePageControllerImp> {
  final CategoriesModel categoriesModel;
  final int i;

  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.categories, i, categoriesModel.categoriesId.toString());
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                color: AppColor.blue50.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15.0)),
            height: 70,
            width: 70,
            child: SvgPicture.network(
              "${AppApiLink.imagesCategories}/${categoriesModel.categoriesImage}",
              colorFilter: const ColorFilter.mode(
                  AppColor.primaryColor, BlendMode.srcIn),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "${translateData(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
                style:  TextStyle(color: AppColor.blue900,fontSize: MediaQuery.of(context).size.width/28),
              ))
        ],
      ),
    );
  }
}
