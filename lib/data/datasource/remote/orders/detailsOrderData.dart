import 'package:ecommerce/linkApi.dart';
import '../../../../core/class/crud.dart';

class DetailsOrderData{
  Crud crud;

  DetailsOrderData(this.crud);

  getData(orderId)async{
    var response =await crud.postData(AppApiLink.detailsOrder, {
      "orderId":orderId,});
    return response.fold((l) => l, (r) => r);
  }

}