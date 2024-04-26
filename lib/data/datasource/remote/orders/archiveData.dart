import 'package:ecommerce/linkApi.dart';
import '../../../../core/class/crud.dart';

class ArchiveOrderData{
  Crud crud;

  ArchiveOrderData(this.crud);

  getData(userId)async{
    var response =await crud.postData(AppApiLink.archive, {
      "userId":userId,});
    return response.fold((l) => l, (r) => r);
  }


}