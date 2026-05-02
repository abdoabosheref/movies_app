import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/core/utils/app_validator.dart';
import 'package:movies_app/data/text_form_filed_controller_model.dart';
import 'package:movies_app/ui/widgets/buttons/custom_elevated_button.dart';
import 'package:movies_app/ui/widgets/buttons/custom_text_button.dart';
import 'package:movies_app/ui/widgets/custom_language_selector.dart';
import 'package:movies_app/ui/widgets/custom_or_divider.dart';
import 'package:movies_app/ui/widgets/custom_text_form_filed.dart';
import '../../../core/utils/app_assets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    double screenHeight = context.screenHeight;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: TextFormFiledControllerModel.formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.04,
                right: screenWidth * 0.04,
                top: screenHeight * 0.03,
              ),
              child: Column(
                children: [
                  Image.asset(AppAssets.appLogo),
                  SizedBox(height: screenHeight * 0.074),
                  CustomTextFormFiled(
                    keyboardType:TextInputType.emailAddress ,
                    validator: (value) => AppValidator.validateEmail(value),
                    controller: TextFormFiledControllerModel.nameController,
                    prefixIcon: AppAssets.email,
                    hintText: "email".tr(),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextFormFiled(
                    obscureText: false, //todo: show password
                    validator: (value) => AppValidator.validatePassword(value),
                    controller: TextFormFiledControllerModel.passwordController,
                    prefixIcon: AppAssets.password,
                    hintText: "password".tr(),
                    suffixIcon: AppAssets.invisibilityIcon,
                    showPassword: () {
                      //todo: show password
                    },
                  ),
                  SizedBox(height: screenHeight * 0.018),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomTextButton(onPressed: (){
                        //todo: Navigate to forget password screen
                      }, text: "forget_password".tr(),
                        textStyle: AppStyles.yellow14BlackRoboto,),
                    ],
                  ),
                  SizedBox(height:screenHeight * 0.035),
                  CustomElevatedButton(
                    onPressed: () {
                      if(TextFormFiledControllerModel.formKey.currentState!.validate()){
                        //todo: login auth
                      }
                    },
                    child: Text(
                      "login".tr(),
                      style: AppStyles.black20RegularRoboto,
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.024),
                  Row(mainAxisAlignment: .center,spacing: screenWidth*0.004,
                    children: [
                      Text("dont_have_account".tr(),style:AppStyles.white14RegularRoboto ,),
                      CustomTextButton(onPressed: (){
                        //todo: Navigate to login screen
                      }, text:"create_one".tr(),
                        textStyle: AppStyles.yellow14BlackRoboto,),
                    ],
                  ),
                  SizedBox(height: context.screenHeight * 0.03),
                  CustomOrDivider(),
                  SizedBox(height: context.screenHeight * 0.03),
                  CustomElevatedButton(
                    onPressed: () {
                      //todo: login with google
                    },
                    child: Row(
                      spacing: screenWidth * 0.02,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppAssets.googleAuthIcon),
                        Text(
                          "login_with_google".tr(),
                          style: AppStyles.black16RegularRoboto,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.035),
                  CustomLanguageSelector(),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
