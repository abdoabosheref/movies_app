import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/mvvm/views/ui/widgets/custom_rating_box.dart';
import 'package:movies_app/mvvm/views/ui/widgets/main_loading.dart';

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
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Image.network(
            imageString,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return MainLoading();
            },
            errorBuilder: (context, error, stackTrace) => Center(
              child: SizedBox(
                child: Icon(Icons.broken_image, color: AppColors.yellow),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.01,
                  horizontal: screenWidth * 0.02),
              child: CustomRatingBox(rating: rating),
            ),
          ),
        ],
      ),
    );
  }
}
