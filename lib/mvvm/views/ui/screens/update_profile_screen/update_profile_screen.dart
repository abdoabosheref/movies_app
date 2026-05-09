import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_lists.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_bottom_sheet.dart';
import '../../widgets/buttons/custom_elevated_button.dart';
import '../../widgets/buttons/custom_text_button.dart';
import '../../widgets/custom_header.dart';
import '../../widgets/custom_text_form_filed.dart';

class UpdateProfileScreen extends StatelessWidget {
   UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = context.screenHeight;
    double screenWidth = context.screenWidth;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            spacing: screenHeight * 0.02,
            children: [
              CustomHeader(title: 'pick_avatar'.tr()),
              InkWell(
                onTap: () {
                  //Todo: shows bottom sheet to pick avatar
                  showModalBottomSheet(context: context,
                      backgroundColor: AppColors.transparent,
                      builder: (context) => CustomBottomSheet(
                        builder: (context, index) {
                          return InkWell(
                            onTap: (){
                              Navigator.of(context).pop();

                            },
                            child: Container(padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border:  Border.all(color: AppColors.yellow,width: 1),
                                color: AppColors.transparent,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child:Image.asset(AppLists.avatarList[index],fit: BoxFit.cover,),),
                          );

                        },
                      ),);
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage(AppAssets.avatarImage8),
                  radius: 50,
                ),
              ),
              CustomTextFormFiled(
                prefixIcon: AppAssets.profileIcon,
                hintText: 'John Safwat',
              ),
              CustomTextFormFiled(
                prefixIcon: AppAssets.phoneIcon,
                hintText: '01200000000',
              ),
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: CustomTextButton(
                  text:'reset_password'.tr(),
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
                onPressed: () {
                  //todo:delete account
                },
              ),
              CustomElevatedButton(
                child: Text(
                  'update_data'.tr(),
                  style: AppStyles.black20RegularRoboto,
                ),
                onPressed: () {
                  //todo:update data
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
