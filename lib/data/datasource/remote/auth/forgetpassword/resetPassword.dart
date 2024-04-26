import 'package:ecommerce/linkApi.dart';

import '../../../../../core/class/crud.dart';


class ResetPasswordData {
  Crud crud;

  ResetPasswordData(this.crud);

  postData( String email,
      String userPassword) async {
    var response = await crud.postData(AppApiLink.resetPassword, {
      "userEmail": email,
      "userPassword": userPassword,
    });
    return response.fold((l) => l, (r) => r);
  }
}
