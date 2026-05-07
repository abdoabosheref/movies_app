import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget text;
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
      ),
      onPressed: onPressed,
      child:text,
    );
  }
}
