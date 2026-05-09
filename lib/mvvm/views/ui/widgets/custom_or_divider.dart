import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class CustomOrDivider extends StatelessWidget {
  const CustomOrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.13),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              endIndent: screenWidth * 0.03,
              color: AppColors.yellow,
              thickness: 2,
            ),
          ),
          Text("or".tr(), style: AppStyles.yellow14BlackRoboto),
          Expanded(
            child: Divider(
              indent: screenWidth * 0.03,
              color: AppColors.yellow,
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
