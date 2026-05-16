import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';

import '../../../../core/utils/app_context.dart';

class CustomDetailsHeader extends StatelessWidget {
  final String? movieTitle;

  const CustomDetailsHeader({super.key, this.movieTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.02,
        vertical: context.screenHeight * 0.007,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColors.white,
              size: 32,

            ),
          ),
          IconButton(
            onPressed: () {
              // Action when clicking the bookmark icon
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Bookmarked $movieTitle",
                  ),
                ),
              );
            },
            icon: SvgPicture.asset(AppAssets.bookMark),
          ),
        ],
      ),
    );
  }
}
