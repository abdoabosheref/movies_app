import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_color.dart';
import 'package:movies_app/utils/app_style.dart';

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
      style:AppStyle.reg16White,
      decoration: InputDecoration(
        hintStyle: AppStyle.reg16White,
        filled: true,
        fillColor: AppColor.lightBlack,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        prefixIconColor: AppColor.white,
        suffixIconColor: AppColor.white,
        focusedBorder: buildBorder(borderColor: AppColor.yellow, ),
        errorBorder: buildBorder( borderColor: AppColor.red),
        focusedErrorBorder:buildBorder(borderColor: AppColor.red) ,
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
