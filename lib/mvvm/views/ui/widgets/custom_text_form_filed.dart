import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class CustomTextFormFiled extends StatelessWidget {
 const CustomTextFormFiled({
    super.key,
     this.controller,
     this.keyboardType,
     this.validator,
     this.hintText,
   required this.prefixIcon,
    this.suffixIcon,
    this.showPassword,
    this.obscureText = false,
  });
 final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? hintText ;
  final String prefixIcon ;
  final String? suffixIcon ;
  final VoidCallback? showPassword;
  final bool obscureText;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      obscuringCharacter: "*",

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
        prefixIcon: SvgPicture.asset(prefixIcon,width: 30,height: 30,fit: .scaleDown,),
        suffixIcon: suffixIcon != null? GestureDetector(
            onTap:showPassword,
            child: SvgPicture.asset(suffixIcon!,width: 30,height: 30,fit: .scaleDown,)): null ,

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
