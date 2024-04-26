import 'package:ecommerce/linkApi.dart';
import '../../../core/class/crud.dart';

class OffersData{
  Crud crud;

  OffersData(this.crud);

  getData(userId)async{
    var response =await crud.postData(AppApiLink.offers, {"userId":userId});
    return response.fold((l) => l, (r) => r);
  }

}