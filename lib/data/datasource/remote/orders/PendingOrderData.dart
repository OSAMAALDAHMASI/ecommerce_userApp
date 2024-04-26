import 'package:ecommerce/linkApi.dart';
import '../../../../core/class/crud.dart';

class PendingOrderData{
  Crud crud;

  PendingOrderData(this.crud);

  getData(userId)async{
    var response =await crud.postData(AppApiLink.pendingOrder, {
      "userId":userId,});
    return response.fold((l) => l, (r) => r);
  }

  deleteOrder(orderId)async{
    var response =await crud.postData(AppApiLink.deleteOrder, {
      "orderId":orderId,});
    return response.fold((l) => l, (r) => r);
  }

}