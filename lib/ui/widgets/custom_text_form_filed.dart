import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';

class CustomTextFormFiled extends StatelessWidget {
  CustomTextFormFiled({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.validator,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
  });
  TextEditingController controller;
  String? Function(String?)? validator;
  TextInputType? keyboardType;
   String hintText ;
  Widget? prefixIcon ;
  Widget? suffixIcon ;


  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      style:AppStyles.white16RegularRoboto,
      decoration: InputDecoration(
        hintStyle: AppStyles.white16RegularRoboto,
        filled: true,
        fillColor: AppColors.darkGrey,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        prefixIconColor: AppColors.white,
        suffixIconColor: AppColors.white,
        focusedBorder: buildBorder(borderColor: AppColors.yellow, ),
        errorBorder: buildBorder( borderColor: AppColors.red),
        focusedErrorBorder:buildBorder(borderColor: AppColors.red) ,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon ,
      ),


    );
  }
  OutlineInputBorder buildBorder ({required Color borderColor}){
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color:borderColor, width: 1,
        ));
  }

}
