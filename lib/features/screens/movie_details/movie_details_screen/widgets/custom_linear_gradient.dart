import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';

class CustomLinearGradient extends StatelessWidget {
  const CustomLinearGradient({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = context.screenHeight;
    return Container(
      height: screenHeight * 0.72,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, AppColors.black],
        ),
      ),
    );
  }
}
