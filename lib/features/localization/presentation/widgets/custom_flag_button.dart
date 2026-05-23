import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class CustomFlagButton extends StatelessWidget {
  final String flagName;
  final bool isSelected;
  final VoidCallback onPressed;

  const CustomFlagButton(
      {super.key, required this.flagName, required this.isSelected, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed,
      icon: SvgPicture.asset(flagName),
      style: IconButton.styleFrom(
        tapTargetSize:.shrinkWrap ,
        padding: .zero,
        side: BorderSide(
            color: isSelected ? AppColors.yellow : AppColors.black,
            width:  isSelected? 10 : 0
        )

    ),);
  }
}