import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/core/utils/app_validator.dart';
import 'package:movies_app/mvvm/view_model/reset_password_auth/forget_password_cubit.dart';
import 'package:movies_app/mvvm/views/ui/widgets/buttons/custom_elevated_button.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_header.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_text_form_filed.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_toast.dart';

import '../../../../view_model/reset_password_auth/forget_password_states.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: SingleChildScrollView(
              child: Form(
                key: forgetPasswordFormKey,
                child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
                  listener: (context, state) {
                    // TODO: implement listener
                    if (state is ForgetPasswordSuccess) {
                      CustomToast.showSuccessToast(
                        context,
                        "Password reset link has been sent to your email",
                      );
                    } else if (state is ForgetPasswordError) {
                      CustomToast.showErrorToast(context, state.message);
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        CustomHeader(title: 'forget_password'.tr()),
                        Image.asset(AppAssets.resetPassword),
                        CustomTextFormFiled(
                          prefixIcon: AppAssets.email,
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'email'.tr(),
                          controller: emailController,
                          validator: (email) {
                            return AppValidator.validateEmail(email: email);
                          },
                        ),
                        SizedBox(height: context.screenWidth * 0.04),

                        state is ForgetPasswordLoading
                            ? const CircularProgressIndicator()
                            : CustomElevatedButton(
                                onPressed: () {
                                  if (forgetPasswordFormKey.currentState!
                                      .validate()) {
                                    context
                                        .read<ForgetPasswordCubit>()
                                        .resetPassword(emailController.text);
                                  }
                                },
                                child: Text(
                                  'verify_email'.tr(),
                                  style: AppStyles.black20RegularRoboto,
                                ),
                              ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
