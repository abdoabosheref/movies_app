import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/data_model/OnboardingModel.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/ui/widgets/buttons/custom_elevated_button.dart';

class OnboardingBottomCard extends StatelessWidget {
  final OnboardingModel item;
  final int index;
  final int length;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const OnboardingBottomCard({
    super.key,
    required this.item,
    required this.index,
    required this.length,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
double screenWidth = context.screenWidth ;
double screenHeight = context.screenHeight ;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.025,
        horizontal: screenWidth * 0.03,
      ),
      decoration: BoxDecoration(
        color:index==0? AppColors.transparent : AppColors.black,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(spacing: screenHeight*0.01,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: index == 0 ?
            AppStyles.white36MediumInter :
            AppStyles.white24BoldInter,
          ),

          if (index != length - 1)
            Text(
              item.desc,
              textAlign: TextAlign.center,
              style: AppStyles.white20RegularRoboto,
            ),

          SizedBox(height: screenHeight * 0.01),

           CustomElevatedButton(onPressed: onNext,
              child: Text(
                index == length - 1 ?
                'finish'.tr() :
                index == 0 ?
                'explore_now'.tr() :
                'next'.tr(),
                style: AppStyles.black20SemiBoldInter,
              ),),

          if (index > 1)
            CustomElevatedButton(
              borderColor: AppColors.yellow,
              backgroundColor: AppColors.black,
              onPressed: () {
                onBack();
              },
              child: Text('back'.tr(),
                  style: AppStyles.yellow20SemiBoldInter),),
        ],
      ));

  }
}