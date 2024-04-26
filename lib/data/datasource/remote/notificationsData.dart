

import 'package:ecommerce/linkApi.dart';
import '../../../core/class/crud.dart';

class NotificationsData{
  Crud crud;

  NotificationsData(this.crud);

  getData(userId)async{
    var response =await crud.postData(AppApiLink.notificationView, {
      "userId":userId,});
    return response.fold((l) => l, (r) => r);
  }

}