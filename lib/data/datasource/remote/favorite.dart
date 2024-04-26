import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/linkApi.dart';
import 'package:get/get.dart';

import '../../../core/class/crud.dart';

class FavoriteData{
  Crud crud;

  FavoriteData(this.crud);

  add(userId,itemsId)async{
    var response =await crud.postData(AppApiLink.favoriteAdd, {
      "userId":userId,"itemsId":itemsId});
    return response.fold((l) => l, (r) => r);
  }

  delete(userId,itemsId)async{
    var response =await crud.postData(AppApiLink.favoriteDelete, {
      "userId":userId,"itemsId":itemsId});
    return response.fold((l) => l, (r) => r);
  }

}