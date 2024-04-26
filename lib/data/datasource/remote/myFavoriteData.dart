import 'package:ecommerce/linkApi.dart';
import '../../../core/class/crud.dart';

class MyFavoriteData{
  Crud crud;

  MyFavoriteData(this.crud);

  getData(userId)async{
    var response =await crud.postData(AppApiLink.favoriteView, {
      "id":userId,});
    return response.fold((l) => l, (r) => r);
  }
  deleteData(favoriteId)async{
    var response =await crud.postData(AppApiLink.deleteFromFavoritePage, {
      "id":favoriteId,});
    return response.fold((l) => l, (r) => r);
  }

}