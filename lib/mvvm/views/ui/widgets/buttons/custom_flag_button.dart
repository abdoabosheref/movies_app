import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class CustomFlagButton extends StatelessWidget {
  final String flagName;
  final bool isSelected;
  const CustomFlagButton({super.key,required this.flagName,this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){}, icon: SvgPicture.asset(flagName),style: IconButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap ,
        padding: EdgeInsets.zero,
        side: BorderSide(
            color: isSelected ? AppColors.yellow : AppColors.black,
            width:  isSelected? 10 : 0
        )

    ),);
  }
}