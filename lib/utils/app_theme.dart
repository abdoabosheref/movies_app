import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_style.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.black,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.lightBlack,
      selectedItemColor: AppColor.yellow,
      unselectedItemColor: AppColor.white,
      type: BottomNavigationBarType.fixed,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.yellow,
        foregroundColor: AppColor.black,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    ),
    dividerTheme: DividerThemeData(thickness: 2, color: AppColor.yellow),

    appBarTheme: AppBarThemeData(
      centerTitle: true,
      backgroundColor: AppColor.black,
      foregroundColor: AppColor.yellow,
      titleTextStyle: AppStyle.reg16Yellow,
    ),

    //TextFormField InputDecoration
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppStyle.reg16White,
      filled: true,
      fillColor: AppColor.lightBlack,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: AppColor.white, width: 1),
      ),
      prefixIconColor: AppColor.white,
      suffixIconColor: AppColor.white,
    ),
  );
}
