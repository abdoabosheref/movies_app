import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/domain/entities/movie_suggestions/movies.dart';

import 'custom_movie_poster.dart';

class CustomGridView extends StatelessWidget {
  final List<Movies>? movies;

  const CustomGridView({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    double screenHeight = context.screenHeight;
    double screenWidth = context.screenWidth;
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.66,
        crossAxisSpacing: screenWidth * 0.05,
        mainAxisSpacing: screenHeight * 0.015,
      ),
      itemCount: movies?.length,
      itemBuilder: (context, index) => CustomMoviePoster(
        imageString: movies?[index].mediumCoverImage ?? '',
        rating: movies?[index].rating.toString() ?? '',
      ),
    );
  }
}
