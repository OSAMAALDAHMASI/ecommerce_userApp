import 'package:ecommerce/linkApi.dart';

import '../../../core/class/crud.dart';

class SearchData{
  Crud crud;

  SearchData(this.crud);

  getData()async{
    var response =await crud.postData(AppApiLink.search, {});
    return response.fold((l) => l, (r) => r);
  }



}