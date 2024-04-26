import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/function/handlingData_controller.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/notificationsData.dart';
import 'package:ecommerce/data/model/notificationsModel.dart';
import 'package:get/get.dart';

abstract class NotificationsController extends GetxController {
  getData();
}

class NotificationsControllerImp extends NotificationsController {
  StatusRequest statusRequest = StatusRequest.none;
  NotificationsData notificationsData = NotificationsData(Get.find());
  MyServices myServices = Get.find();
  List<NotificationsModel> data = [];

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationsData.getData(
      myServices.sharedPreferences.getString("id"),
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
          List responseData = response['data'];
          data.clear();
          data.addAll(responseData.map((e) => NotificationsModel.fromJson(e)));
          update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
