import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/core/utils/app_validator.dart';
import 'package:movies_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:movies_app/mvvm/views/ui/widgets/buttons/custom_elevated_button.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_text_form_filed.dart';

import '../cubit/auth_cubit.dart';

class CustomRegisterForm extends StatefulWidget {
  const CustomRegisterForm({super.key});

  @override
  State<CustomRegisterForm> createState() => _CustomRegisterFormState();
}

class _CustomRegisterFormState extends State<CustomRegisterForm> {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final double screenHeight = context.screenHeight;

    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous,
          current) => current is ChangePasswordVisibilityState,
      builder: (context, state) {
        var authCubit = context.read<AuthCubit>();
        return Form(
          key: registerFormKey,
          child: Column(
            spacing: screenHeight * 0.018,
            children: [
              CustomTextFormFiled(
                prefixIcon: AppAssets.name,
                hintText: 'name'.tr(),
                keyboardType: TextInputType.name,
                controller: authCubit.registerNameController,
                validator: (name) => AppValidator.validateName(name: name),
              ),
              CustomTextFormFiled(
                prefixIcon: AppAssets.email,
                hintText: 'email'.tr(),
                keyboardType: TextInputType.emailAddress,
                controller: authCubit.registerEmailController,
                validator: (email) => AppValidator.validateEmail(email: email),
              ),
              CustomTextFormFiled(
                  prefixIcon: AppAssets.password,
                  obscureText: authCubit.isPasswordHidden,
                  isPassword: true,
                  hintText: 'password'.tr(),
                  keyboardType: TextInputType.visiblePassword,
                  controller: authCubit.registerPasswordController,
                  validator: (password) =>
                      AppValidator.validatePassword(password: password),

                  showPassword: () => authCubit.togglePasswordVisibility()
              ),
              CustomTextFormFiled(
                prefixIcon: AppAssets.password,
                obscureText: authCubit.isConfirmPasswordHidden,
                isPassword: true,
                hintText: 'confirm_password'.tr(),
                keyboardType: TextInputType.visiblePassword,
                controller: authCubit.registerConfirmPasswordController,
                showPassword: () => authCubit.toggleConfirmPasswordVisibility(),
                validator: (confirmPassword) =>
                    AppValidator.validateConfirmPassword(
                      password: authCubit.registerPasswordController.text,
                      confirmPassword: confirmPassword,
                    ),
              ),
              CustomTextFormFiled(
                prefixIcon: AppAssets.phoneIcon,
                hintText: 'phone_number'.tr(),
                keyboardType: TextInputType.phone,
                controller: authCubit.registerPhoneController,
                validator: (phoneNumber) =>
                    AppValidator.validatePhone(phoneNumber: phoneNumber),
              ),
              CustomElevatedButton(
                onPressed: () {
                  //todo: create account auth
                  if (registerFormKey.currentState!.validate()) {
                    authCubit.registerWithEmailAndPassword(
                      email: authCubit.registerEmailController.text,
                      password: authCubit.registerPasswordController.text,
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