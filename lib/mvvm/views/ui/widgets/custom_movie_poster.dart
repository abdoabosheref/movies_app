import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';

class  CustomMoviePoster extends StatelessWidget {
  const  CustomMoviePoster({super.key, required this.imageString,
    required this.width, required this.height,required this.rating });
final String imageString ;
final double width ;
final double height ;
final String rating ;

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    double screenHeight = context.screenHeight;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        image: DecorationImage(
          image: AssetImage(imageString,),
          fit:BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(
            top: screenHeight * 0.015,
            left: screenWidth* 0.03,
          ),
          child: Container(
            constraints: BoxConstraints(
            ),
            decoration: BoxDecoration(
              color: AppColors.blackOpacity71,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric( horizontal:screenWidth*0.02, vertical:screenHeight*0.004),
              child: Row(
                mainAxisSize: .min,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: screenWidth * 0.01,
                children: [
                  Text(
                    rating,
                    style: AppStyles.white16RegularRoboto,
                  ),
                  Icon(
                    Icons.star,
                    color: AppColors.yellow,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
