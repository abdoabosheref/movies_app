import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_styles.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_context.dart';

class SeeMoreTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  const SeeMoreTextButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
      ),
      onPressed: onPressed,
      child: Row(spacing: screenWidth * 0.01,
        children: [
          Text('see_more'.tr(),style: AppStyles.yellow16RegularRoboto,),
          Icon(Icons.arrow_forward_sharp,color: AppColors.yellow,size: 14,)
        ],
      )
    );
  }
}
