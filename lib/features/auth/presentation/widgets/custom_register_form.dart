import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/core/utils/app_validator.dart';
import 'package:movies_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:movies_app/mvvm/views/ui/widgets/buttons/custom_elevated_button.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_text_form_filed.dart';
import '../cubit/auth_cubit.dart';

class CustomRegisterForm extends StatelessWidget {
  const CustomRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {

    final double screenHeight = context.screenHeight;

    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) => current is ChangePasswordVisibilityState || current is AuthInitial,
      builder: (context, state) {
        var authCubit = context.read<AuthCubit>();
        return Form(
          key: authCubit.registerFormKey,
          child: Column(
            spacing: screenHeight * 0.018,
            children: [
              CustomTextFormFiled(
                prefixIcon: AppAssets.name,
                hintText: 'name'.tr(),
                keyboardType: TextInputType.name,
                controller: authCubit.nameController,
                validator: (name) => AppValidator.validateName(name: name),
              ),
              CustomTextFormFiled(
                prefixIcon: AppAssets.email,
                hintText: 'email'.tr(),
                keyboardType: TextInputType.emailAddress,
                controller: authCubit.emailController,
                validator: (email) => AppValidator.validateEmail(email: email),
              ),
              CustomTextFormFiled(
                  prefixIcon: AppAssets.password,
                  obscureText: authCubit.isPasswordHidden,
                  isPassword: true,
                  hintText: 'password'.tr(),
                  keyboardType: TextInputType.visiblePassword,
                  controller: authCubit.passwordController,
                  validator: (password) =>
                      AppValidator.validatePassword(password: password),

                  showPassword: () => authCubit.togglePasswordVisibility()
              ),
              CustomTextFormFiled(
                prefixIcon: AppAssets.password,
                obscureText: authCubit.isPasswordHidden,
                isPassword: true,
                hintText: 'confirm_password'.tr(),
                keyboardType: TextInputType.visiblePassword,
                controller: authCubit.confirmPasswordController,
                showPassword: () => authCubit.togglePasswordVisibility(),
                validator: (confirmPassword) =>
                    AppValidator.validateConfirmPassword(
                      password: authCubit.passwordController.text,
                      confirmPassword: confirmPassword,
                    ),
              ),
              CustomTextFormFiled(
                prefixIcon: AppAssets.phoneIcon,
                hintText: 'phone_number'.tr(),
                keyboardType: TextInputType.phone,
                controller: authCubit.phoneController,
                validator: (phoneNumber) =>
                    AppValidator.validatePhone(phoneNumber: phoneNumber),
              ),
              CustomElevatedButton(
                onPressed: () {
                  //todo: create account auth
                  if (authCubit.registerFormKey.currentState!.validate()) {
                    authCubit.registerWithEmailAndPassword(
                      email: authCubit.emailController.text,
                      password: authCubit.passwordController.text,
                    );
                  }
                },
                child: Text(
                  'create_account'.tr(),
                  style: AppStyles.black20RegularRoboto,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
