import 'package:ecommerce/controller/itemsPageController.dart';
import 'package:ecommerce/core/function/translateData.dart';
import 'package:ecommerce/data/model/categoriesModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';


class CustomListCategoriesItems extends GetView<ItemsPageControllerImp> {
  const CustomListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:80,
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

class Categories extends GetView<ItemsPageControllerImp> {
  final CategoriesModel categoriesModel;
  final int i;

  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCategories(i,categoriesModel.categoriesId.toString());

      },
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 8.0),
              child: GetBuilder<ItemsPageControllerImp>(
                  builder: (controller) => Container(
                        padding: const EdgeInsets.only(
                          bottom: 4.0,
                        ),
                        decoration: controller.selectedCategories != i
                            ? null
                            : const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 3,
                                        color: AppColor.primaryColor))),
                        child: Text(
                          "${translateData(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
                          style:  TextStyle(
                              color: AppColor.blue700, fontSize: MediaQuery.of(context).size.width/22),
                        ),
                      ))),

        ],
      ),
    );
  }
}
