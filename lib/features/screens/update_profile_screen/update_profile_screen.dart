import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_lists.dart';
import 'package:movies_app/core/utils/app_routes.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:movies_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:movies_app/features/widgets/custom_toast.dart';
import '../../widgets/buttons/custom_elevated_button.dart';
import '../../widgets/buttons/custom_text_button.dart';
import '../../widgets/custom_header.dart';
import '../../widgets/custom_text_form_filed.dart';
import 'widgets/custom_bottom_sheet.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = context.screenHeight;
    double screenWidth = context.screenWidth;
    AuthCubit authCubit = context.read<AuthCubit>();


    return BlocConsumer<AuthCubit, AuthState>(
        listener:  (context, state) {
          if (state is AuthDeleteSuccess) {
            CustomToast.showSuccessToast(context, state.successMessage!);
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.loginScreen,
                  (route) => false,
            );
          }else if (state is AuthFailure) {
            CustomToast.showErrorToast(context, state.errorMessage);
          }
        },
      builder: (context, state) {
        final user = authCubit.currentUser!;
        String avatarImageName =
            'assets/images/avatar_image_${user.avatarIndex + 1}.png';



        return Scaffold(

          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.04, right: screenWidth * 0.04),
              child: SingleChildScrollView(
                child: Column(
                  spacing: screenHeight * 0.02,
                  children: [
                    CustomHeader(title: 'pick_avatar'.tr()),
                    InkWell(
                      onTap: () {
                        // shows bottom sheet to pick avatar
                        showModalBottomSheet(context: context,
                          backgroundColor: AppColors.transparent,
                          builder: (context) =>
                              CustomBottomSheet(
                                builder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      authCubit.selectAvatar(index);
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.yellow, width: 1),
                                        color: AppColors.transparent,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Image.asset(
                                        AppLists.avatarList[index],
                                        fit: BoxFit.cover,),),
                                  );
                                },
                              ),);
                      },
                      child: CircleAvatar(
                        backgroundImage: AssetImage(avatarImageName),
                        radius: 50,
                        backgroundColor: AppColors.transparent,
                      ),
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
                        onPressed: () {
                          Navigator.pushNamed(
                              context, AppRoutes.forgetPasswordScreen);
                        },
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.25,),
                    CustomElevatedButton(
                      backgroundColor: AppColors.red,
                      child: Text(
                        'delete_account'.tr(),
                        style: AppStyles.white20RegularRoboto,
                      ),

                      onPressed: () {
                        //Todo: delete user account
                        authCubit.deleteAccount(context);


                      },
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
                          newAvatarIndex: authCubit.selectedAvatarIndex,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
