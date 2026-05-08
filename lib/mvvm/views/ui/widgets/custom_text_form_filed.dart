import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class CustomTextFormFiled extends StatelessWidget {
  CustomTextFormFiled({
    super.key,
    this.controller,
    this.keyboardType,
    this.validator,
    this.hintText,
    required this.prefixIcon,
    this.isPassword = false,
    this.showPassword,
    this.obscureText = false,
  });
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? hintText;
  final String prefixIcon;
  final bool isPassword;

  final VoidCallback? showPassword;
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      obscuringCharacter: "*",
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      cursorRadius: Radius.circular(16),
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      style: AppStyles.white16RegularRoboto,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppStyles.white16RegularRoboto,
        filled: true,
        fillColor: AppColors.darkGrey,
        prefixIconColor: AppColors.white,
        suffixIconColor: AppColors.white,
        prefixIcon: SvgPicture.asset(
          prefixIcon,
          width: 30,
          height: 30,
          fit: .scaleDown,
        ),
        suffixIcon: isPassword
            ? IconButton(icon: Icon(obscureText?Icons.visibility_off:Icons.visibility), onPressed: showPassword)
            : null,
        enabledBorder: buildBorder(borderColor: AppColors.transparent),
        focusedBorder: buildBorder(borderColor: AppColors.yellow),
        errorBorder: buildBorder(borderColor: AppColors.red),
        focusedErrorBorder: buildBorder(borderColor: AppColors.red),
      ),
    );
  }

  OutlineInputBorder buildBorder({required Color borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: borderColor, width: 1),
    );
  }
}
