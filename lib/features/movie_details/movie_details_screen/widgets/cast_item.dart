import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_cached_network_image.dart';

class CastItem extends StatelessWidget {
  final String name ;
  final String character;
  final String image;
  const CastItem({super.key, required this.name, required this.character, required this.image});

  @override
  Widget build(BuildContext context) {
    double screenHeight = context.screenHeight;
    double screenWidth = context.screenWidth;
    return Container(
      margin: EdgeInsets.only(bottom: screenHeight*0.015),
      padding: EdgeInsets.symmetric(horizontal: screenWidth*0.02,vertical: screenHeight*0.01),
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        spacing: 12,
        children: [
          CustomCachedNetworkImage(imageString: image,borderRadius: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name : $name",
                    style: AppStyles.white20RegularRoboto),
                Text("Character : $character",
                    style: AppStyles.white20RegularRoboto),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
