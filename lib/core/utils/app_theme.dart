import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static  final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkGrey,
      selectedItemColor: AppColors.yellow,
      unselectedItemColor: AppColors.white,
      type: BottomNavigationBarType.fixed,
    ),

    dividerTheme: DividerThemeData(thickness: 2, color: AppColors.yellow),

    );
}
