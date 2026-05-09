import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';

class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet({super.key, required this.builder});

  Widget? Function(BuildContext, int) builder;

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    double screenHeight = context.screenHeight;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.037,
        vertical: screenHeight * 0.018,
      ),
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(19),
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 18,
          childAspectRatio: 36 / 35,
          mainAxisSpacing: 19,
          crossAxisCount: 3,
        ),
        itemBuilder: builder,
      ),
    );
  }
}
