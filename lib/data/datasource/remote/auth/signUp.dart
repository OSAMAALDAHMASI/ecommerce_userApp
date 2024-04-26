import 'package:ecommerce/linkApi.dart';
import '../../../../core/class/crud.dart';

class SignupData {
  Crud crud;

  SignupData(this.crud);

  postData(String userName, String email, String userPhone,
      String userPassword) async {
    var response = await crud.postData(AppApiLink.signUp, {
      "userName": userName,
      "userEmail": email,
      "userPhone": userPhone,
      "userPassword": userPassword,
    });
    return response.fold((l) => l, (r) => r);
  }
}
