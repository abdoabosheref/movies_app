import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';

//Todo:  how to use this class
//Todo:  CustomToast.showSuccessToast(context, "Login Successfully");
//Todo:  CustomToast.showErrorToast(context, "Something went wrong");





class CustomToast {
  static final FToast _fToast = FToast();

  static void showSuccessToast(BuildContext context, String message) {
    _show(
      context: context,
      message: message,
      icon: Icons.check_circle_outline,
      backgroundColor: AppColors.green,
    );
  }

  static void showErrorToast(BuildContext context, String message) {
    _show(
      context: context,
      message: message,
      icon: Icons.error_outline,
      backgroundColor: AppColors.red,
    );
  }

  static void _show({
    required BuildContext context,
    required String message,
    required IconData icon,
    required Color backgroundColor,
  }) {
    _fToast.init(context);
    _fToast.removeQueuedCustomToasts();

    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    Widget toast = Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.015,
      ),
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      constraints: BoxConstraints(
        maxWidth: screenWidth * 0.9,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: backgroundColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: AppColors.white,
            // Responsive icon size
            size: 30,
          ),
          SizedBox(width: screenWidth * 0.03),
          Flexible(
            child: Text(
              message,
              style: AppStyles.white20RegularRoboto
            ),
          ),
        ],
      ),
    );

    _fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 2),
    );
  }
}