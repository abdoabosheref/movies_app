import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/core/utils/app_routes.dart';

import 'custom_cached_network_image.dart';
import 'custom_rating_box.dart';

class CustomMoviePoster extends StatelessWidget {

  final String imageString;
  final String rating;
  final bool isBackground;
  final int? movieId;

  const CustomMoviePoster({
    super.key,
    required this.imageString,
    required this.rating,
    this.isBackground = false,
    this.movieId,

  });


  @override
  Widget build(BuildContext context) {
    double screenWidth = context.screenWidth;
    double screenHeight = context.screenHeight;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.movieDetailsScreen,
          arguments: movieId,
        );
      },
      child: Stack(
        children: [
          CustomCachedNetworkImage(imageString: imageString,isBackground: isBackground,),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.01,
                horizontal: screenWidth * 0.02,
              ),
              child: CustomRatingBox(rating: rating),
            ),
          ),
        ],
      ),
    );
  }
}
