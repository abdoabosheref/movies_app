import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_routes.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:movies_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:movies_app/features/auth/presentation/screens/login_screen.dart';
import 'package:movies_app/features/widgets/custom_toast.dart';
import '../../../widgets/buttons/custom_elevated_button.dart';

class ProfileRowOfButtons extends StatelessWidget {
  const ProfileRowOfButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    double screenWidth = context.screenWidth;

    return BlocListener<AuthCubit ,AuthState>(
      listener:  (context, state) {
        if (state is AuthSuccess){
          CustomToast.showSuccessToast(context, state.successMessage!);
        }else if (state is AuthInitial){
         Navigator.pushNamedAndRemoveUntil(context,
             AppRoutes.loginScreen, (route) => false);
        }else if (state is AuthFailure){
          CustomToast.showErrorToast(context, state.errorMessage);
        }
      },
      child: Row(
        spacing: screenWidth * 0.02,
        children: [
          Expanded(
            flex: 2,
            child: CustomElevatedButton(
              child: Text('edit_profile'.tr()),
              onPressed: () {
                context.read<AuthCubit>().setupUpdateProfile();
                // Navigate to update profile screen
                Navigator.of(context).pushNamed(AppRoutes.updateProfileScreen);
              },
            ),
          ),
          Expanded(
            child: CustomElevatedButton(
              backgroundColor: AppColors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: screenWidth * 0.02,
                children: [
                  Text('exit'.tr(), style: AppStyles.white20RegularRoboto),
                  SvgPicture.asset(AppAssets.exitIcon),
                ],
              ),
              onPressed: () {
                // logout using firebase auth
                context.read<AuthCubit>().logout();

              },
            ),
          ),
        ],
      ),
    );
  }
}
