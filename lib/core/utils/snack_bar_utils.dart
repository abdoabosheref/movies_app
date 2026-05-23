import 'package:flutter/material.dart';

import 'app_colors.dart';

class SnackBarUtils {
  static void showLoading({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context)=> Center(
            child: CircularProgressIndicator(color: AppColors.yellow)),
      barrierDismissible : false,
    );
  }
  static void showErrorMessage({required BuildContext context,required String errorMessage}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          errorMessage,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        action: SnackBarAction(
          label: 'Retry',
          textColor: Colors.white,
          onPressed: () {
          },
        ),
      ),
    );
  }
  static void showSuccessMessage({required BuildContext context,required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.green,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
  static void hideLoading({required BuildContext context}) {
    Navigator.of(context).pop();
  }
}