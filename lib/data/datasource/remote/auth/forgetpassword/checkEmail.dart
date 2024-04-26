import 'package:ecommerce/linkApi.dart';
import '../../../../../core/class/crud.dart';


class CheckEmailData {
  Crud crud;

  CheckEmailData(this.crud);

  postData(String email) async {
    var response = await crud.postData(AppApiLink.checkEmail, {
      "userEmail": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
