import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_routes.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/core/utils/app_validator.dart';
import 'package:movies_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:movies_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:movies_app/features/localization/presentation/widgets/custom_language_selector.dart';
import 'package:movies_app/mvvm/views/ui/widgets/buttons/custom_elevated_button.dart';
import 'package:movies_app/mvvm/views/ui/widgets/buttons/custom_text_button.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_or_divider.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_text_form_filed.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    double screenHeight = context.screenHeight;
    var authCubit = context.read<AuthCubit>();

    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            CustomToast.showSuccessToast(context, 'Loading...');
          } else if (state is AuthSuccess) {
            CustomToast.showSuccessToast(context, 'login success');
            Navigator.pushReplacementNamed(context, AppRoutes.mainScreen);
          } else if (state is AuthFailure) {
            CustomToast.showErrorToast(context, 'login error');
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Form(
              key: authCubit.authFormKey,
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
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) =>
                            AppValidator.validateEmail(email: email),
                        controller: authCubit.emailController,
                        prefixIcon: AppAssets.email,
                        hintText: "email".tr(),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      CustomTextFormFiled(
                        obscureText:  authCubit.isConfirmPasswordHidden,
                        //todo: show password
                        validator: (password) =>
                            AppValidator.validatePassword(password: password),
                        controller: authCubit.passwordController,
                        prefixIcon: AppAssets.password,
                        hintText: "password".tr(),
                        isPassword: true,
                        showPassword: () => authCubit.toggleConfirmPasswordVisibility(),
                      ),
                      SizedBox(height: screenHeight * 0.018),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomTextButton(onPressed: () {
                            //todo: Navigate to forget password screen
                            Navigator.pushNamed(
                                context, AppRoutes.forgetPasswordScreen);
                          }, text: "forget_password".tr()),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.035),
                      CustomElevatedButton(
                        //todo:login
                        onPressed: () {
                          if (authCubit.authFormKey.currentState!.validate()) {
                            context.read<AuthCubit>().loginWithEmailAndPassword(
                              authCubit.emailController.text,
                              authCubit.passwordController.text,
                            );
                          }
                        },
                        child: Text(
                          "login".tr(),
                          style: AppStyles.black20RegularRoboto,
                        ),
                      ),
                      SizedBox(height: context.screenHeight * 0.024),
                      Row(mainAxisAlignment: .center,
                        spacing: screenWidth * 0.004,
                        children: [
                          Text("dont_have_account".tr(),
                            style: AppStyles.white14RegularRoboto,),
                          CustomTextButton(onPressed: () {
                            //todo: Navigate to signup screen
                            Navigator.pushNamed(
                                context, AppRoutes.registerScreen);
                          }, text: "create_one".tr(),
                          ),
                        ],
                      ),
                      SizedBox(height: context.screenHeight * 0.03),
                      CustomOrDivider(),
                      SizedBox(height: context.screenHeight * 0.03),
                      CustomElevatedButton(
                        onPressed: () {
                          //todo: login with google
                          context.read<AuthCubit>().loginWithGoogle();
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
        },

      ),
    );
  }
}
