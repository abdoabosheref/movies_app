import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_style.dart';

class CustomInput extends StatelessWidget {
  CustomInput({
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
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon ,
      ),


    );
  }
}
