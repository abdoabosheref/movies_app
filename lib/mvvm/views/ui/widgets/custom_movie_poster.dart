import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_styles.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_rating_box.dart';

class  CustomMoviePoster extends StatelessWidget {
  const  CustomMoviePoster({super.key, required this.imageString
    ,required this.rating });
final String imageString ;
final String rating ;


  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    double screenHeight = context.screenHeight;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        image: DecorationImage(
          image: AssetImage(imageString,),
          fit:BoxFit.fill,
        ),
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical:screenHeight*0.01,
              horizontal:screenWidth*0.02),
          child: CustomRatingBox(rating: rating),
        ),
      ),
    );
  }
}
