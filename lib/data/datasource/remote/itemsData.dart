import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/linkApi.dart';
import 'package:get/get.dart';

import '../../../core/class/crud.dart';

class ItemsData{
  Crud crud;

  ItemsData(this.crud);

  getData(categoriesId,userId)async{
    var response =await crud.postData(AppApiLink.items, {
      "id":categoriesId,"userId":userId});
    return response.fold((l) => l, (r) => r);
  }

}