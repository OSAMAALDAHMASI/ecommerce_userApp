import 'package:ecommerce/core/services/services.dart';
import 'package:get/get.dart';

translateData(columnAr, columnEn) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columnAr;
  } else {
    return columnEn;
  }
}
