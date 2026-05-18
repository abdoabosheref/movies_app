import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class CustomRatingBox extends StatelessWidget {
  const CustomRatingBox({super.key, required this.rating});
  final String rating ;

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    double screenHeight = context.screenHeight;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.blackOpacity71,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric( horizontal:screenWidth*0.02,
            vertical:screenHeight*0.004),
        child: Row(
          mainAxisSize: .min,
          spacing: screenWidth * 0.01,
          children: [
            Text(
              rating,
              style: AppStyles.white16RegularRoboto,
            ),
            Icon(
              Icons.star,
              color: AppColors.yellow,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
