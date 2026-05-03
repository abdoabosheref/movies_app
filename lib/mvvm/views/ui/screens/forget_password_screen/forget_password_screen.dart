import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/core/utils/app_validator.dart';
import 'package:movies_app/mvvm/views/ui/widgets/buttons/custom_elevated_button.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_header.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_text_form_filed.dart';


class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

    TextEditingController emailController = TextEditingController();
    GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: SingleChildScrollView(
            child: Form(
              key: forgetPasswordFormKey,
              child: Column(
                children: [
                  CustomHeader(title: 'forget_password'.tr(),),
                  Image.asset(AppAssets.resetPassword),
                  CustomTextFormFiled(
                    prefixIcon: AppAssets.email,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'email'.tr(),
                    controller: emailController,
                    validator: (text) {
                      return AppValidator.validateEmail(text);
                    },
                  ),
                  SizedBox(height: context.screenWidth * 0.04),
                  CustomElevatedButton(
                    onPressed: () {
                      //todo : Auth password reset via email
                      if(forgetPasswordFormKey.currentState!.validate()){

                      }

                    },
                    child: Text(
                      'verify_email'.tr(),
                      style: AppStyles.black20RegularRoboto,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
