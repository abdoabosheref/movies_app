import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';


class MovieGridItem extends StatelessWidget {
  final double rate;
  final String image;

  const MovieGridItem({
    super.key,
    required this.rate,
    required this.image,

    required,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            image,
            //fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        // Rating Badge
        Positioned(
          top: 10,
          left: 10,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * 0.018,
              vertical: context.screenHeight * 0.004,
            ),
            decoration: BoxDecoration(
              color: AppColors.blackOpacity70,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("$rate", style: AppStyles.white16RegularRoboto),
                const SizedBox(width: 4),
                Icon(Icons.star, color: AppColors.yellow, size: 14),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
