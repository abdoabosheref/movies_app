import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  const CustomHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    double screenHeight = context.screenHeight;
    return SizedBox(height: screenHeight*0.06,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              },
            icon: SvgPicture.asset(
              AppAssets.goldenArrowBack,
              width: 25,fit: BoxFit.scaleDown,
            ),
          ),
          Text(title, style: AppStyles.yellow16RegularRoboto),
          SizedBox(width: screenWidth * 0.14),
        ],
      ),
    );
  }
}
