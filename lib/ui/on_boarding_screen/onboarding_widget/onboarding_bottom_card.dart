import 'package:flutter/material.dart';
import 'package:movies_app/core/custom_widget/custom_button.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_size.dart';
import 'package:movies_app/utils/app_style.dart';

import '../../../core/data_model/OnboardingModel.dart';
import '../../../l10n/app_localizations.dart';



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
            AppStyle.med36White :
            AppStyle.bold24White,
          ),

          SizedBox(height: height * 0.01),

          if (index != length - 1)
            Text(
              item.desc,
              textAlign: TextAlign.center,
              style: index == 0
                  ? AppStyle.reg20LightBlack
                  : AppStyle.reg20White,
            ),

          SizedBox(height: height * 0.02),

          /// NEXT
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.yellow,
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
              ),
              onPressed: onNext,
              child: Text(
                index == length - 1 ?
                AppLocalizations.of(context)!.finish :
                index == 0 ?
                AppLocalizations.of(context)!.explore_now :
                AppLocalizations.of(context)!.next,
                style: AppStyle.smb20Black,
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
              child: CustomButton(
                onPressed: () {  },
                child: Text(AppLocalizations.of(context)!.back,
                    style: AppStyle.smb20Yellow),
              color: AppColor.black,borderColor: AppColor.yellow,)
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