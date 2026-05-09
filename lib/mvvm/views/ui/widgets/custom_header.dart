import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  const CustomHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            AppAssets.goldenArrowBack,
            width: 25,
            fit: .scaleDown,
            matchTextDirection: true,
          ),
        ),
        Text(title, style: AppStyles.yellow16RegularRoboto),
        SizedBox(width: screenWidth * 0.14),
      ],
    );
  }
}
