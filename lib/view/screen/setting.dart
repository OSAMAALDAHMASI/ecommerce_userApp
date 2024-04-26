import 'package:ecommerce/controller/settingController.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageAssets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    SettingControllerImp controller = Get.put(SettingControllerImp());
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                color: AppColor.primaryColor,
                height: Get.width / 3,
              ),
              Positioned(
                  top: Get.width / 3.5,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                    child: const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(AppImageAssets.avatar)),
                  ))
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text("Disable Notification"),
                  trailing: Switch(
                    onChanged: (val) {},
                    value: true,
                  ),
                ),
                ListTile(
                  title: const Text("Orders"),
                  trailing: const Icon(Icons.card_travel_outlined),
                  onTap: () {
                    controller.goToPendingPage();
                  },
                ),
                ListTile(
                  title: const Text("Archive"),
                  trailing: const Icon(Icons.archive_outlined),
                  onTap: () {
                    controller.goToArchivePage();
                  },
                ),
                ListTile(
                  title: const Text("Language"),
                  trailing: const Icon(Icons.language_outlined),
                  onTap: () {
                    controller.changeLang();
                  },
                ),
                ListTile(
                    title: const Text("Address"),
                    trailing: const Icon(Icons.location_on_outlined),
                    onTap: () {
                      controller.goToAddressPage();
                    }),
                const ListTile(
                  title: Text("About Us"),
                  trailing: Icon(Icons.help_outline),
                ),
                const ListTile(
                  title: Text("Contact Us"),
                  trailing: Icon(Icons.phone_callback_outlined),
                ),
                ListTile(
                  title: const Text("Logout"),
                  trailing: const Icon(Icons.logout_outlined),
                  onTap: () {
                    controller.logOut();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
