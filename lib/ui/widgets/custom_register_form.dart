import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/core/utils/app_validator.dart';
import 'package:movies_app/data/text_form_filed_controller_model.dart';
import 'package:movies_app/ui/widgets/buttons/custom_elevated_button.dart';
import 'package:movies_app/ui/widgets/custom_text_form_filed.dart';
class CustomRegisterForm extends StatelessWidget {
  const CustomRegisterForm({super.key,required this.onPressed});
  final VoidCallback onPressed ;
  @override
  Widget build(BuildContext context) {

   final double screenHeight = context.screenHeight;

    return Form(
      key:   TextFormFiledControllerModel.formKey ,
      child: Column(spacing: screenHeight *0.025 ,mainAxisSize: .min,
        children: [
          CustomTextFormFiled(prefixIcon: AppAssets.name,
            hintText: 'name'.tr(),
            keyboardType: TextInputType.name,
            controller:TextFormFiledControllerModel.nameController ,
            validator: (text) {
              return AppValidator.validateName(text);
            },
          ),
          CustomTextFormFiled(prefixIcon: AppAssets.email,
            hintText: 'email'.tr(),
            keyboardType: TextInputType.emailAddress,
            controller:TextFormFiledControllerModel.emailController ,
            validator: (text) {
              return AppValidator.validateEmail(text);
            },
          ),
          CustomTextFormFiled(prefixIcon: AppAssets.password,
            obscureText: false, //todo: show password
            suffixIcon: AppAssets.invisibilityIcon,
            hintText: 'password'.tr(),
            keyboardType: TextInputType.visiblePassword,
            controller:TextFormFiledControllerModel.passwordController ,
            validator: (text) {
              return AppValidator.validatePassword(text);
            },
            showPassword: (){
              //todo: show password
            },
          ),
          CustomTextFormFiled(prefixIcon: AppAssets.password,
            obscureText: false, //todo: show password
            suffixIcon: AppAssets.invisibilityIcon,
            hintText: 'confirm_password'.tr(),
            keyboardType: TextInputType.visiblePassword,
            controller:TextFormFiledControllerModel.confirmPasswordController ,
            showPassword: (){
              //todo: show password
            },
            validator: (text) {
              return AppValidator.validateConfirmPassword(text,
                  TextFormFiledControllerModel.passwordController.text);
            },
          ),
          CustomTextFormFiled(prefixIcon: AppAssets.phoneIcon,
            hintText: 'phone_number'.tr(),
            keyboardType: TextInputType.phone,
            controller:TextFormFiledControllerModel.phoneNameController ,
            validator: (text) {
              return AppValidator.validatePhone(text);
            },
          ),
          CustomElevatedButton(onPressed:onPressed,
            child: Text('create_account'.tr(),style: AppStyles.black20RegularRoboto,),),

        ],
      ),
    );
  }

}
