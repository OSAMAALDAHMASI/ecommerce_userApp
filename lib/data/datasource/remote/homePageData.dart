import 'package:ecommerce/linkApi.dart';

import '../../../core/class/crud.dart';

class HomePageData{
  Crud crud;

  HomePageData(this.crud);

  getData()async{
    var response =await crud.postData(AppApiLink.homePage, {});
    return response.fold((l) => l, (r) => r);
  }

  search(String searchText)async{
    var response =await crud.postData(AppApiLink.search, {
      "searchText":searchText
    });
    return response.fold((l) => l, (r) => r);
  }

}