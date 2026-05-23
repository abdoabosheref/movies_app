import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_routes.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/core/utils/snack_bar_utils.dart';

import '../../../../core/utils/app_lists.dart';
import '../../../localization/presentation/widgets/custom_language_selector.dart';
import '../../../widgets/buttons/custom_text_button.dart';
import '../../../widgets/custom_header.dart';
import '../../../widgets/custom_slider.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_states.dart';
import '../widgets/custom_register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = context.read<AuthCubit>();
    double screenWidth = context.screenWidth;
    double screenHeight = context.screenHeight;
    return BlocListener<AuthCubit, AuthState>(
      bloc: authCubit,
      listenWhen: (previous, current) =>
          current is AuthSuccess ||
          current is AuthFailure ||
          current is AuthLoading,
      listener: (context, state) {
        if (state is! AuthLoading) {
          SnackBarUtils.hideLoading(context: context);
        }
        switch (state) {
          case AuthSuccess():
            SnackBarUtils.showSuccessMessage(
              context: context,
              message: 'Registered successfully',
            );
            Navigator.of(context).pushReplacementNamed(AppRoutes.loginScreen);
            break;
          case AuthLoading():
            SnackBarUtils.showLoading(context: context);
            break;
          case AuthFailure():
            SnackBarUtils.showErrorMessage(
              context: context,
              errorMessage: state.errorMessage,
            );
            break;
          case AuthInitial():
          case AvatarChangedState():
          case ChangePasswordVisibilityState():
            case AuthDeleteSuccess():
              case AuthDeleteFailure():
            break;
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: SingleChildScrollView(
              child: Column(
                spacing: screenHeight * 0.0035,
                children: [
                  CustomHeader(title: 'register'.tr()),
                  CustomSlider(
                    viewportFraction: 0.380,
                    underSliderText: 'avatar'.tr(),
                    height: screenHeight * 0.17,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.4,
                    list: AppLists.avatarList.map((avatar) {
                      return Builder(
                        builder: (BuildContext context) {
                          return InkWell(
                            onTap: () => authCubit.selectAvatar(
                              AppLists.avatarList.indexOf(avatar),
                            ),
                            child: Image.asset(avatar, fit: BoxFit.cover),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  CustomRegisterForm(),
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        'already_have_account'.tr(),
                        style: AppStyles.white14RegularRoboto,
                      ),
                      CustomTextButton(
                        onPressed: () {
                          authCubit.registerClearControllers();
                          Navigator.of(
                            context,
                          ).pushReplacementNamed(AppRoutes.loginScreen);
                        },
                        text: 'login'.tr(),
                        textStyle: AppStyles.yellow14BlackRoboto,
                      ),
                    ],
                  ),
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
