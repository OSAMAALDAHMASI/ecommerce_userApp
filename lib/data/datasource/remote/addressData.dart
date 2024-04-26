import 'package:ecommerce/linkApi.dart';

import '../../../core/class/crud.dart';

class AddressData {
  Crud crud;

  AddressData(this.crud);

  add(Map<String,dynamic>data) async {
    var response = await crud.postData(AppApiLink.addressAdd,data);
    return response.fold((l) => l, (r) => r);
  }

  delete(String addressId) async {
    var response = await crud.postData(
        AppApiLink.addressDelete, {"addressId": addressId,});
    return response.fold((l) => l, (r) => r);
  }

  edite(String name, String addressId, String phone, String city, String street,
      double lat, double long, String addressType) async {
    var response = await crud.postData(
        AppApiLink.addressEdite, {
      "name": name,
      "addressId": addressId,
      "phone": phone,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
      "type": addressType,
        });
    return response.fold((l) => l, (r) => r);
  }

  getData(String userId) async {
    var response = await crud.postData(AppApiLink.addressView, {
      "usersId": userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
