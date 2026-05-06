import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';

import 'buttons/custom_flag_button.dart';

class CustomLanguageSelector extends StatelessWidget {
  const CustomLanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    return Container(width: screenWidth * 0.3,decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.yellow,width: 2)
    ),child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomFlagButton(flagName: AppAssets.usaFlagIcon,isSelected: true,),
        CustomFlagButton(flagName: AppAssets.egyptFlagIcon,),
      ],),);
  }
}