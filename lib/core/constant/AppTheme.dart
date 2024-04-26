import 'package:flutter/material.dart';
import 'color.dart';

ThemeData themeEnglish =ThemeData(
  appBarTheme:  AppBarTheme(
    centerTitle: true,
    iconTheme: const IconThemeData(color: AppColor.primaryColor),
    titleTextStyle:const TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: AppColor.primaryColor,) ,
    backgroundColor: Colors.grey[50],
  ),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
    useMaterial3: false,
    fontFamily:"Cairo",//"Roboto",//"PlayfairDisplay" ,
    textTheme: const TextTheme(
        displayLarge: TextStyle(
          //Like headLine1
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.black),
        bodyLarge: TextStyle(
          //Like bodytext1
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: AppColor.grey)));

ThemeData themeArabic =ThemeData(
    appBarTheme:  AppBarTheme(
      centerTitle: true,
      iconTheme: const IconThemeData(color: AppColor.primaryColor),
      titleTextStyle:const TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: AppColor.primaryColor,) ,
      backgroundColor: Colors.grey[50],
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
    useMaterial3: false,
    fontFamily:"Cairo",
    textTheme: const TextTheme(
        displayLarge: TextStyle(
          //Like headLine1
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.black),
        bodyLarge: TextStyle(
          //Like bodytext1
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: AppColor.grey)));