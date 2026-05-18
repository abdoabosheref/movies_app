import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class MovieInfoCard extends StatelessWidget {
  final VoidCallback onTap;
  final String iconPath;
  final String value;

  const MovieInfoCard(
      {super.key, required this.onTap, required this.iconPath, required this.value});

  @override
  Widget build(BuildContext context) {
    double screenHeight = context.screenHeight;
    double screenWidth = context.screenWidth;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.06, vertical: screenHeight * 0.0065),
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(iconPath, width: 25, color: AppColors.yellow),
            const SizedBox(width: 8),
            Text(value, style: AppStyles.white22BoldRoboto),
          ],
        ),
      ),
    );
  }
}
