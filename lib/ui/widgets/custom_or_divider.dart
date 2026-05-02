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
      padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.23),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: AppColors.yellow,
              thickness: 2,
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.023),
            child: Text(
              "or".tr(),
              style: AppStyles.yellow14BlackRoboto,
            ),
          ),
          Expanded(
            child: Divider(
              color: AppColors.yellow,
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
