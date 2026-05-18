import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/mvvm/views/ui/widgets/buttons/custom_elevated_button.dart';

class CustomErrorColumn extends StatelessWidget {
  final VoidCallback onPressed;
  final String errorMessage;
  const CustomErrorColumn({super.key,required this.onPressed,required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    double screenHeight = context.screenHeight;
    double screenWidth = context.screenWidth;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.04),
      child: Column(
        spacing: screenHeight * 0.02,
        mainAxisAlignment: .center,
        crossAxisAlignment: .stretch,
        children: [
          Text(
            errorMessage,
            style: AppStyles.yellow20SemiBoldInter,
            textAlign: .center,
          ),
          CustomElevatedButton(onPressed: onPressed, child: Text('try_again'.tr())),
        ],
      ),
    );
  }
}
