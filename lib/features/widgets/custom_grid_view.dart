import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_context.dart';
import 'package:movies_app/domain/entities/movie_response/movie.dart';

import 'custom_movie_poster.dart';
typedef OntTap = void Function(int index);
class CustomGridView extends StatelessWidget {

  final bool isScrollable;
  final List<Movie>? movies;

  const CustomGridView({super.key, required this.movies,this.isScrollable = true});

  @override
  Widget build(BuildContext context) {
    double screenHeight = context.screenHeight;
    double screenWidth = context.screenWidth;
    return GridView.builder(
      shrinkWrap: !isScrollable,
      padding: EdgeInsets.zero,
       physics: isScrollable?
           const AlwaysScrollableScrollPhysics()
           :const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.66,
        crossAxisSpacing: screenWidth * 0.04,
        mainAxisSpacing: screenHeight * 0.015,
      ),
      itemCount: movies?.length,
      itemBuilder: (context, index) => CustomMoviePoster(
         movieId: movies?[index].id,
        imageString: movies?[index].mediumCoverImage ?? '',
        rating: movies?[index].rating.toString() ?? '',
      ),
    );
  }
}
