import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth= context.screenWidth;
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
      IconButton(onPressed: (){Navigator.pop(context);}, icon: SvgPicture.asset(AppAssets.goldenArrowBack,color: AppColors.yellow,width: 25,)),
      Text('pick_avatar'.tr(),style: AppStyles.yellow16RegularRoboto,),
      SizedBox(width: screenWidth*0.14,)
    ],);
  }
}
