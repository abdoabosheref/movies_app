import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkGrey,
      selectedItemColor: AppColors.yellow,
      unselectedItemColor: AppColors.white,
      type: BottomNavigationBarType.fixed,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.yellow,
        foregroundColor: AppColors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    ),
    dividerTheme: DividerThemeData(thickness: 2, color: AppColors.yellow),

    appBarTheme: AppBarThemeData(
      centerTitle: true,
      backgroundColor: AppColors.black,
      foregroundColor: AppColors.yellow,
      titleTextStyle: AppStyles.white16RegularRoboto,
    ),

    //TextFormField InputDecoration
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppStyles.white16RegularRoboto,
      filled: true,
      fillColor: AppColors.darkGrey,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide:  BorderSide(color: AppColors.white, width: 1),
      ),
      prefixIconColor: AppColors.white,
      suffixIconColor: AppColors.white,
    ),
  );
}
