import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.color,
    required this.onPressed,
    required this.child,
    this.borderColor = AppColors.transparent,
  });

  Color? color;
  Color borderColor;
  VoidCallback onPressed;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        side: BorderSide(color: borderColor, width: 2),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
