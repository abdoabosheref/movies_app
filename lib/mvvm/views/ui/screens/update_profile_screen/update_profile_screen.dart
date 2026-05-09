import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';

import '../../../../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../../../../features/auth/presentation/cubit/auth_states.dart';
import '../../widgets/buttons/custom_elevated_button.dart';
import '../../widgets/buttons/custom_text_button.dart';
import '../../widgets/custom_header.dart';
import '../../widgets/custom_text_form_filed.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = context.screenHeight;
    double screenWidth = context.screenWidth;
    AuthCubit authCubit = context.read<AuthCubit>();
    final user = authCubit.currentUser!;
    String avatarImageName =
        'assets/images/avatar_image_${user.avatarIndex + 1}.png';

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                spacing: screenHeight * 0.02,
                children: [
                  CustomHeader(title: 'pick_avatar'.tr()),
                  CircleAvatar(
                    backgroundImage: AssetImage(avatarImageName),
                    radius: 50,
                    backgroundColor: AppColors.transparent,
                  ),
                  CustomTextFormFiled(
                    prefixIcon: AppAssets.profileIcon,
                    controller: authCubit.updateNameController,
                  ),
                  CustomTextFormFiled(
                    prefixIcon: AppAssets.phoneIcon,
                    controller: authCubit.updatePhoneController,
                  ),
                  Align(
                    alignment: AlignmentGeometry.centerLeft,
                    child: CustomTextButton(
                      text: 'reset_password'.tr(),
                      textStyle: AppStyles.white20RegularRoboto,
                      onPressed: () {},
                    ),
                  ),
                  Spacer(),
                  CustomElevatedButton(
                    backgroundColor: AppColors.red,
                    child: Text(
                      'delete_account'.tr(),
                      style: AppStyles.white20RegularRoboto,
                    ),

                    onPressed: () {},
                  ),
                  CustomElevatedButton(
                    child: Text(
                      'update_data'.tr(),
                      style: AppStyles.black20RegularRoboto,
                    ),
                    onPressed: () {
                      authCubit.updateUserData(
                        newName: authCubit.updateNameController.text,
                        newPhone: authCubit.updatePhoneController.text,
                        newAvatarIndex: 5,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
