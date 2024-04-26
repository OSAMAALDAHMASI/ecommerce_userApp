import 'package:ecommerce/linkApi.dart';
import '../../../../core/class/crud.dart';

class LoginData {
  Crud crud;

  LoginData(this.crud);

  postData( String email,
      String userPassword) async {
    var response = await crud.postData(AppApiLink.login, {
      "userEmail": email,
      "userPassword": userPassword,
    });
    return response.fold((l) => l, (r) => r);
  }
}
