import 'package:ecommerce/core/localzation/translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/intialbinding.dart';
import 'core/localzation/changeLocal.dart';
import 'core/services/services.dart';
import 'routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController langController = Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App',
      theme:langController.appTheme ,
      initialBinding:InitialBinding() ,
      getPages: routes,
      translations: MyTranslation(),
      locale: langController.language,
    );
  }
}


//---------------------------------------------------------------
//
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
//
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Shimmer',
//       routes: <String, WidgetBuilder>{
//         'loading': (_) => const LoadingListPage(),
//         'slide': (_) => SlideToUnlockPage(),
//       },
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Shimmer'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Column(
//           children: <Widget>[
//             ListTile(
//               title: const Text('Loading List'),
//               onTap: () => Navigator.of(context).pushNamed('loading'),
//             ),
//             ListTile(
//               title: const Text('Slide To Unlock'),
//               onTap: () => Navigator.of(context).pushNamed('slide'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class LoadingListPage extends StatefulWidget {
//   const LoadingListPage({super.key});
//
//   @override
//   State<LoadingListPage> createState() => _LoadingListPageState();
// }
//
// class _LoadingListPageState extends State<LoadingListPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Loading List'),
//       ),
//       body: Shimmer.fromColors(
//           baseColor: Colors.grey.shade300,
//           highlightColor: Colors.grey.shade100,
//           enabled: true,
//           child: const SingleChildScrollView(
//             physics: NeverScrollableScrollPhysics(),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 BannerPlaceholder(),
//                 TitlePlaceholder(width: double.infinity),
//                 SizedBox(height: 16.0),
//                 ContentPlaceholder(
//                   lineType: ContentLineType.threeLines,
//                 ),
//                 SizedBox(height: 16.0),
//                 TitlePlaceholder(width: 200.0),
//                 SizedBox(height: 16.0),
//                 ContentPlaceholder(
//                   lineType: ContentLineType.twoLines,
//                 ),
//                 SizedBox(height: 16.0),
//                 TitlePlaceholder(width: 200.0),
//                 SizedBox(height: 16.0),
//                 ContentPlaceholder(
//                   lineType: ContentLineType.twoLines,
//                 ),
//               ],
//             ),
//           )),
//     );
//   }
// }
//
// class SlideToUnlockPage extends StatelessWidget {
//   final List<String> days = <String>[
//     'Monday',
//     'Tuesday',
//     'Wednesday',
//     'Thursday',
//     'Friday',
//     'Saturday',
//     'Sunday'
//   ];
//   final List<String> months = <String>[
//     'January',
//     'February',
//     'March',
//     'April',
//     'May',
//     'June',
//     'July',
//     'August',
//     'September',
//     'October',
//     'November',
//     'December',
//   ];
//
//   SlideToUnlockPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final DateTime time = DateTime.now();
//     final int hour = time.hour;
//     final int minute = time.minute;
//     final int day = time.weekday;
//     final int month = time.month;
//     final int dayInMonth = time.day;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Slide To Unlock'),
//       ),
//       body: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           Image.asset(
//             'assets/images/avatar.jpg',
//             fit: BoxFit.cover,
//           ),
//           Positioned(
//             top: 48.0,
//             right: 0.0,
//             left: 0.0,
//             child: Center(
//               child: Column(
//                 children: <Widget>[
//                   Text(
//                     '${hour < 10 ? '0$hour' : '$hour'}:${minute < 10 ? '0$minute' : '$minute'}',
//                     style: const TextStyle(
//                       fontSize: 60.0,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(vertical: 4.0),
//                   ),
//                   Text(
//                     '${days[day - 1]}, ${months[month - 1]} $dayInMonth',
//                     style: const TextStyle(fontSize: 24.0, color: Colors.white),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//               bottom: 32.0,
//               left: 0.0,
//               right: 0.0,
//               child: Center(
//                 child: Opacity(
//                   opacity: 0.8,
//                   child: Shimmer.fromColors(
//                     baseColor: Colors.black12,
//                     highlightColor: Colors.white,
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         Image.asset(
//                           'assets/images/avatar.png',
//                           height: 20.0,
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 4.0),
//                         ),
//                         const Text(
//                           'Slide to unlock',
//                           style: TextStyle(
//                             fontSize: 28.0,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }
//
//
//
// class BannerPlaceholder extends StatelessWidget {
//   const BannerPlaceholder({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 200.0,
//       margin: const EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12.0),
//         color: Colors.white,
//       ),
//     );
//   }
// }
//
// class TitlePlaceholder extends StatelessWidget {
//   final double width;
//
//   const TitlePlaceholder({
//     Key? key,
//     required this.width,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: width,
//             height: 12.0,
//             color: Colors.white,
//           ),
//           const SizedBox(height: 8.0),
//           Container(
//             width: width,
//             height: 12.0,
//             color: Colors.white,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// enum ContentLineType {
//   twoLines,
//   threeLines,
// }
//
// class ContentPlaceholder extends StatelessWidget {
//   final ContentLineType lineType;
//
//   const ContentPlaceholder({
//     Key? key,
//     required this.lineType,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             width: 96.0,
//             height: 72.0,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12.0),
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(width: 12.0),
//           Expanded(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: double.infinity,
//                   height: 10.0,
//                   color: Colors.white,
//                   margin: const EdgeInsets.only(bottom: 8.0),
//                 ),
//                 if (lineType == ContentLineType.threeLines)
//                   Container(
//                     width: double.infinity,
//                     height: 10.0,
//                     color: Colors.white,
//                     margin: const EdgeInsets.only(bottom: 8.0),
//                   ),
//                 Container(
//                   width: 100.0,
//                   height: 10.0,
//                   color: Colors.white,
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

//---------------------------------------------------------------
//
// import 'package:flutter/material.dart';
// import 'package:quickalert/quickalert.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'QuickAlert Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     final successAlert = buildButton(
//       onTap: () {
//         QuickAlert.show(
//           context: context,
//           type: QuickAlertType.success,
//           text: 'Transaction Completed Successfully!',
//           autoCloseDuration: const Duration(seconds: 2),
//           showConfirmBtn: false,
//         );
//       },
//       title: 'Success',
//       text: 'Transaction Completed Successfully!',
//       leadingImage: 'assets/success.gif',
//     );
//
//     final errorAlert = buildButton(
//       onTap: () {
//         QuickAlert.show(
//           context: context,
//           type: QuickAlertType.error,
//           title: 'Oops...',
//           text: 'Sorry, something went wrong',
//           backgroundColor: Colors.black,
//           titleColor: Colors.white,
//           textColor: Colors.white,
//         );
//       },
//       title: 'Error',
//       text: 'Sorry, something went wrong',
//       leadingImage: 'assets/error.gif',
//     );
//
//     final warningAlert = buildButton(
//       onTap: () {
//         QuickAlert.show(
//           context: context,
//           type: QuickAlertType.warning,
//           text: 'You just broke protocol',
//         );
//       },
//       title: 'Warning',
//       text: 'You just broke protocol',
//       leadingImage: 'assets/warning.gif',
//     );
//
//     final infoAlert = buildButton(
//       onTap: () {
//         QuickAlert.show(
//           context: context,
//           type: QuickAlertType.info,
//           text: 'Buy two, get one free',
//         );
//       },
//       title: 'Info',
//       text: 'Buy two, get one free',
//       leadingImage: 'assets/info.gif',
//     );
//
//     final confirmAlert = buildButton(
//       onTap: () {
//         QuickAlert.show(
//           onCancelBtnTap: () {
//             Navigator.pop(context);
//           },
//           context: context,
//           type: QuickAlertType.confirm,
//           text: 'Do you want to logout',
//           titleAlignment: TextAlign.right,
//           textAlignment: TextAlign.right,
//           confirmBtnText: 'Yes',
//           cancelBtnText: 'No',
//           confirmBtnColor: Colors.white,
//           backgroundColor: Colors.black,
//           headerBackgroundColor: Colors.grey,
//           confirmBtnTextStyle: const TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//           barrierColor: Colors.white,
//           titleColor: Colors.white,
//           textColor: Colors.white,
//         );
//       },
//       title: 'Confirm',
//       text: 'Do you want to logout',
//       leadingImage: 'assets/confirm.gif',
//     );
//
//     final loadingAlert = buildButton(
//       onTap: () {
//         QuickAlert.show(
//           context: context,
//           type: QuickAlertType.loading,
//           title: 'Loading',
//           text: 'Fetching your data',
//         );
//       },
//       title: 'Loading',
//       text: 'Fetching your data',
//       leadingImage: 'assets/loading.gif',
//     );
//
//     final customAlert = buildButton(
//       onTap: () {
//         var message = '';
//         QuickAlert.show(
//           context: context,
//           type: QuickAlertType.custom,
//           barrierDismissible: true,
//           confirmBtnText: 'Save',
//           customAsset: 'assets/custom.gif',
//           widget: TextFormField(
//             decoration: const InputDecoration(
//               alignLabelWithHint: true,
//               hintText: 'Enter Phone Number',
//               prefixIcon: Icon(
//                 Icons.phone_outlined,
//               ),
//             ),
//             textInputAction: TextInputAction.next,
//             keyboardType: TextInputType.phone,
//             onChanged: (value) => message = value,
//           ),
//           onConfirmBtnTap: () async {
//             if (message.length < 5) {
//               await QuickAlert.show(
//                 context: context,
//                 type: QuickAlertType.error,
//                 text: 'Please input something',
//               );
//               return;
//             }
//             Navigator.pop(context);
//             if (mounted) {
//               QuickAlert.show(
//                 context: context,
//                 type: QuickAlertType.success,
//                 text: "Phone number '$message' has been saved!.",
//               );
//             }
//           },
//         );
//       },
//       title: 'Custom',
//       text: 'Custom Widget Alert',
//       leadingImage: 'assets/custom.gif',
//     );
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 1,
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         title: Text(
//           "QuickAlert Demo",
//           style: Theme.of(context).textTheme.titleMedium,
//         ),
//       ),
//       body: ListView(
//         children: [
//           const SizedBox(height: 20),
//           successAlert,
//           const SizedBox(height: 20),
//           errorAlert,
//           const SizedBox(height: 20),
//           warningAlert,
//           const SizedBox(height: 20),
//           infoAlert,
//           const SizedBox(height: 20),
//           confirmAlert,
//           const SizedBox(height: 20),
//           loadingAlert,
//           const SizedBox(height: 20),
//           customAlert,
//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
//
//   Card buildButton({
//     required onTap,
//     required title,
//     required text,
//     required leadingImage,
//   }) {
//     return Card(
//       shape: const StadiumBorder(),
//       margin: const EdgeInsets.symmetric(
//         horizontal: 20,
//       ),
//       clipBehavior: Clip.antiAlias,
//       elevation: 1,
//       child: ListTile(
//         onTap: onTap,
//         leading: CircleAvatar(
//           backgroundImage: AssetImage(
//             leadingImage,
//           ),
//         ),
//         title: Text(title ?? ""),
//         subtitle: Text(text ?? ""),
//         trailing: const Icon(
//           Icons.keyboard_arrow_right_rounded,
//         ),
//       ),
//     );
//   }
// }