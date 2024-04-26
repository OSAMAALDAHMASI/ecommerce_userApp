import 'package:ecommerce/linkApi.dart';
import '../../../../../core/class/crud.dart';


class VerifyCodeForgetPasswordData {
  Crud crud;

  VerifyCodeForgetPasswordData(this.crud);

  postData( String email, String verfiyCode,
      ) async {
    var response = await crud.postData(AppApiLink.verifyCodeForgetPassword, {
      "email": email,
      "verifyCode": verfiyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}