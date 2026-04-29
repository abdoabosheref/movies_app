import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_context.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final VoidCallback onPressed;
  final Widget child;
  const CustomElevatedButton({
    super.key,
    this.backgroundColor,
    this.textColor,
    required this.onPressed,
    required this.child,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = context.screenHeight;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical:screenHeight*0.02 ),
        backgroundColor: backgroundColor ?? AppColors.yellow,
        foregroundColor: textColor ?? AppColors.black,
        minimumSize: const Size(double.infinity, 0),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        side: BorderSide(color: borderColor ?? AppColors.transparent, width: 2),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
