import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/features/widgets/buttons/custom_text_button.dart';
import 'package:movies_app/features/widgets/custom_text_form_filed.dart';

class CustomActionButtonAlertDialog extends StatelessWidget {
 final String title;
 final String? hintText;
 final VoidCallback confirmOnPressed;
 final VoidCallback cancelOnPressed;
 final TextEditingController? passwordController  ;
 final String? contentTitle ;
 final bool textDialog ;


  const CustomActionButtonAlertDialog({super.key,
    required this.title,
    this.contentTitle,
    this.hintText,
    this.passwordController,
    required this.confirmOnPressed,
    required this.cancelOnPressed,
    this.textDialog = false,

   });


  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
      titlePadding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      backgroundColor: AppColors.darkGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      title: Text(
        title,
        style: AppStyles.yellow20SemiBoldInter,
      ),
      content:textDialog ? Text(contentTitle!,
        style: AppStyles.white20RegularRoboto,)
          : CustomTextFormFiled(
        prefixIcon: AppAssets.password,
        controller: passwordController,
        hintText: hintText,
        obscureText: true,
      ),
      actions: <Widget>[
        Row(mainAxisAlignment:.spaceBetween,children: [
          CustomTextButton(
            text: 'Cancel',textStyle:AppStyles.yellow16RegularRoboto,
            onPressed:cancelOnPressed,
          ),
          CustomTextButton(
            text: 'Confirm',textStyle:AppStyles.yellow16RegularRoboto,
            onPressed:confirmOnPressed,
          ),
        ],),

      ],
    );
  }
}