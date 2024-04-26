import 'package:ecommerce/linkApi.dart';
import '../../../../core/class/crud.dart';

class VerifyCodeSignUpData {
  Crud crud;

  VerifyCodeSignUpData(this.crud);

  postData( String email, String verfiyCode,
      ) async {
    var response = await crud.postData(AppApiLink.verfiyCodeSignUp, {
      "email": email,
      "verifyCode": verfiyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}