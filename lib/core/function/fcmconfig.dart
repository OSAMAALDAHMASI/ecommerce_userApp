import 'package:ecommerce/controller/order/pendingController.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
requestPermissionNotification()async{
  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

}




fcmConfig(){
  FirebaseMessaging.onMessage.listen((message) {
 Get.snackbar("${message.notification!.title}", "${message.notification!.body}");
 FlutterRingtonePlayer().playNotification();
 if(Get.currentRoute=="/pending" && message.data["pagename"]=="orderApprove"){
   refreshPage();
 }

  });
}

refreshPage(){
  PendingControllerImp controller =Get.find();
  controller.refreshOrderPage();
}