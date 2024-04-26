import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkApi.dart';

class CheckoutData{
  Crud crud;

  CheckoutData(this.crud);

  checkout(Map data)async{
    var response =await crud.postData(AppApiLink.checkout, data);
    return response.fold((l) => l, (r) => r);
  }



}