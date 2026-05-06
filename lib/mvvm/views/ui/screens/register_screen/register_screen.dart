import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_routes.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/mvvm/views/ui/widgets/buttons/custom_text_button.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_slider.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_header.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_language_selector.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_register_form.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
   List<String> avatarList = [
     AppAssets.avatarImage1,
     AppAssets.avatarImage2,
     AppAssets.avatarImage3,
     AppAssets.avatarImage4,
     AppAssets.avatarImage5,
     AppAssets.avatarImage6,
     AppAssets.avatarImage7,
     AppAssets.avatarImage8,
     AppAssets.avatarImage9,
   ];
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
                CustomSlider( viewportFraction:0.33 ,
                    underSliderText: 'Avatar',
                    height: screenHeight*0.15,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.4,
                    list: avatarList.map((avatar) {
                  return Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        onTap: () {
                          //Todo: pick Avatar
                        },
                        child: Image.asset(avatar, fit: BoxFit.contain),
                      );
                    },
                  );
                }).toList(),),
                CustomRegisterForm(),
                Row(mainAxisAlignment: .center,
                  children: [
                   Text('already_have_account'.tr(),style:AppStyles.white14RegularRoboto ,),
                    CustomTextButton(onPressed: (){
                      //todo: Navigate to login screen
                      Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
                    }, text:Text('login'.tr(),style: AppStyles.black20RegularRoboto,),
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
