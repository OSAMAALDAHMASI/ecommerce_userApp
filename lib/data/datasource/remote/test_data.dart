import 'package:ecommerce/linkApi.dart';

import '../../../core/class/crud.dart';

class TestData{
  Crud crud;

  TestData(this.crud);

  getData()async{
    var response =await crud.postData(AppApiLink.test, {});
  return response.fold((l) => l, (r) => r);
  }

}