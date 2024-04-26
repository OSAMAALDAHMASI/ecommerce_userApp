import 'package:ecommerce/linkApi.dart';
import '../../../core/class/crud.dart';

class CartData{
  Crud crud;

  CartData(this.crud);

  add(userId,itemsId)async{
    var response =await crud.postData(AppApiLink.cartAdd, {
      "userId":userId,"itemsId":itemsId});
    return response.fold((l) => l, (r) => r);
  }

  delete(userId,itemsId)async{
    var response =await crud.postData(AppApiLink.cartDelete, {
      "userId":userId,"itemsId":itemsId});
    return response.fold((l) => l, (r) => r);
  }
  getItemsCount(userId,itemsId)async{
    var response =await crud.postData(AppApiLink.itemsCounter, {
      "userId":userId,"itemsId":itemsId});
    return response.fold((l) => l, (r) => r);
  }

  getData(userId)async{
    var response =await crud.postData(AppApiLink.cartView, {
      "userId":userId,});
    return response.fold((l) => l, (r) => r);
  }
  checkCoupon(String coupon)async{
    var response =await crud.postData(AppApiLink.checkCoupon, {
      "coupon":coupon,});
    return response.fold((l) => l, (r) => r);
  }

}