import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_color.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    super.key,
    this.color,
    this.textColor,
    required this.onPressed,
    required this.child,
    this.borderColor = Colors.transparent,
  });

  Color? color;
  Color? textColor;
  Color borderColor;
  VoidCallback onPressed;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:color ?? AppColor.yellow,
        foregroundColor:textColor ?? AppColor.black,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        side: BorderSide(color: borderColor, width: 2),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
