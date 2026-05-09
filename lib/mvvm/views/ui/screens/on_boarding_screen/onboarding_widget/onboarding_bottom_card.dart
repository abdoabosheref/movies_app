import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';

import '../../../../../models/on_boarding_model.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';

class OnBoardingBottomCard extends StatelessWidget {
  final int currentIndex;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const OnBoardingBottomCard({
    super.key,
    required this.currentIndex,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final currentItem = onBoardingData[currentIndex];
    final int onBoardingDataListLength = onBoardingData.length;
    double screenWidth = context.screenWidth;
    double screenHeight = context.screenHeight;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.025,
        horizontal: screenWidth * 0.038,
      ),
      decoration: BoxDecoration(
        color: currentIndex == 0 ? AppColors.transparent : AppColors.black,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        spacing: screenHeight * 0.01,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            currentItem.title.tr(),
            textAlign: TextAlign.center,
            style: currentIndex == 0
                ? AppStyles.white32MediumInter
                : AppStyles.white20BoldInter,
          ),

          if (currentIndex != onBoardingDataListLength - 1)
            Text(
              currentItem.desc.tr(),
              textAlign: TextAlign.center,
              style: currentIndex == 0
                  ? AppStyles.white60Opacity17RegularInter
                  : AppStyles.white17RegularInter,
            ),

          SizedBox(height: screenHeight * 0.01),

          CustomElevatedButton(
            onPressed: onNext,
            child: Text(
              currentIndex == onBoardingDataListLength - 1
                  ? 'finish'.tr()
                  : currentIndex == 0
                  ? 'explore_now'.tr()
                  : 'next'.tr(),
              style: AppStyles.black20SemiBoldInter,
            ),
          ),

          if (currentIndex > 1)
            CustomElevatedButton(
              borderColor: AppColors.yellow,
              backgroundColor: AppColors.black,
              onPressed: () {
                onBack();
              },
              child: Text('back'.tr(), style: AppStyles.yellow20SemiBoldInter),
            ),
        ],
      ),
    );
  }
}
