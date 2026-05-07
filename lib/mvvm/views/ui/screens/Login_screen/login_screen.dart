import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_routes.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/core/utils/app_validator.dart';
import 'package:movies_app/mvvm/view_models/login_auth_bloc/login_bloc.dart';
import 'package:movies_app/mvvm/view_models/login_auth_bloc/login_event.dart';
import 'package:movies_app/mvvm/view_models/login_auth_bloc/login_state.dart';
import 'package:movies_app/mvvm/views/ui/widgets/buttons/custom_elevated_button.dart';
import 'package:movies_app/mvvm/views/ui/widgets/buttons/custom_text_button.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_language_selector.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_or_divider.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_text_form_filed.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  final  TextEditingController emailController = TextEditingController(text: 'abdoabosheref@gmail.com');
  final  TextEditingController passwordController = TextEditingController(text: '371998442540aA*');
  final  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    double screenHeight = context.screenHeight;
    return Scaffold(
      body: BlocConsumer<LoginBloc,LoginState>(
        listener:(context, state) {
          if(state is LoginLoading){
            CustomToast.showSuccessToast(context, state.message);
          }else if(state is LoginSuccess){
            CustomToast.showSuccessToast(context, state.message);
            Navigator.pushReplacementNamed(context, AppRoutes.mainScreen);
          }else if(state is LoginError){
            CustomToast.showErrorToast(context, state.message);
          }
        } ,
        builder:(context, state) {
          return  SafeArea(
            child: Form(
              key: loginFormKey,
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
                        controller: emailController,
                        prefixIcon: AppAssets.email,
                        hintText: "email".tr(),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      CustomTextFormFiled(
                        obscureText: true, //todo: show password
                        validator: (value) => AppValidator.validatePassword(value),
                        controller: passwordController,
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
                            Navigator.pushNamed(context,AppRoutes.forgetPasswordScreen);
                          }, text: Text("forget_password".tr(),style:AppStyles.yellow14RegularRoboto ,),),
                        ],
                      ),
                      SizedBox(height:screenHeight * 0.035),
                      CustomElevatedButton(
                        //todo:login
                        onPressed: () {
                          if(loginFormKey.currentState!.validate()){

                            context.read<LoginBloc>().add(
                                LoginSubmit(emailController.text.trim(),
                                    passwordController.text.trim()));

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
                            //todo: Navigate to signup screen
                            Navigator.pushNamed(context,AppRoutes.registerScreen);

                          }, text:Text("create_one".tr(),
                              style:AppStyles.yellow14RegularRoboto)),
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
          );
        } ,

      ),
    );
  }
}
