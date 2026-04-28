import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_color.dart';

class AppTheme {
  static  final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.black,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.lightBlack,
      selectedItemColor: AppColor.yellow,
      unselectedItemColor: AppColor.white,
      type: BottomNavigationBarType.fixed,
    ),

    dividerTheme: DividerThemeData(thickness: 2, color: AppColor.yellow),

    );
}
