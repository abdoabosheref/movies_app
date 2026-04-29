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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.025,
        horizontal: width * 0.03,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.85),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: index == 0 ?
            AppStyles.white36MediumInter :
            AppStyles.white24BoldInter,
          ),

          SizedBox(height: height * 0.01),

          if (index != length - 1)
            Text(
              item.desc,
              textAlign: TextAlign.center,
              style: index == 0
                  ? AppStyles.black20RegularRoboto
                  : AppStyles.white20RegularRoboto,
            ),

          SizedBox(height: height * 0.02),

          /// NEXT
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.yellow,
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
              ),
              onPressed: onNext,
              child: Text(
                index == length - 1 ?
                'finish'.tr() :
                index == 0 ?
                'explore_now'.tr() :
                'next'.tr(),
                style: AppStyles.black20SemiBoldInter,
              ),
            ),
          ),

          SizedBox(height: height * 0.01),

          /// BACK
          ///

          if (index > 1)
            SizedBox(
              width: double.infinity,
              height: context.screenHeight*0.08,
              child: CustomElevatedButton(
                onPressed: () {  },
                child: Text('back'.tr(),
                    style: AppStyles.yellow20SemiBoldInter),)
              /*OutlinedButton(
                onPressed: onBack,
                child: Text(
                  AppLocalizations.of(context)!.back,
                  style: AppStyle.smb20Yellow,
                ),
              ),*/
            ),
        ],
      ),
    );
  }
}