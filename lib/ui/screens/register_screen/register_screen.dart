import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/data/text_form_filed_controller_model.dart';
import 'package:movies_app/ui/widgets/buttons/custom_text_button.dart';
import 'package:movies_app/ui/widgets/custom_avatar_slider.dart';
import 'package:movies_app/ui/widgets/custom_header.dart';
import 'package:movies_app/ui/widgets/custom_language_selector.dart';
import 'package:movies_app/ui/widgets/custom_register_form.dart';

class RegisterScreen extends StatefulWidget {
   RegisterScreen({super.key});
   bool isFlagSelected  = false ;
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    double screenHeight = context.screenHeight;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: SingleChildScrollView(
            child: Column(spacing: screenHeight*0.01,
              children: [
                CustomHeader(title: 'register'.tr()),
                CustomAvatarSlider(),
                CustomRegisterForm(onPressed: (){
                  //todo: create account auth
                  if(TextFormFiledControllerModel.formKey.currentState!.validate()){

                  }
                },),
                Row(mainAxisAlignment: .center,
                  children: [
                   Text('already_have_account'.tr(),style:AppStyles.white14RegularRoboto ,),
                    CustomTextButton(onPressed: (){
                      //todo: Navigate to login screen
                    }, text:'login'.tr(),
                    textStyle: AppStyles.yellow14BlackRoboto,),
                  ],
                ),
               CustomLanguageSelector(),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
