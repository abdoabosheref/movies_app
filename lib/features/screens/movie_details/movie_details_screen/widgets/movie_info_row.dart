import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/domain/entities/movie_details/movie.dart';

import 'movie_info_card.dart';

class MovieInfoRow extends StatelessWidget {
  final Movie? movie;

  const MovieInfoRow({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MovieInfoCard(
          iconPath: AppAssets.likes,
          value: '${movie?.likeCount}',
          onTap: () {},
        ),
        MovieInfoCard(
          iconPath: AppAssets.time,
          value: '${movie?.runtime}',
          onTap: () {},
        ),
        MovieInfoCard(
          iconPath: AppAssets.rating,
          value: '${movie?.rating}',
          onTap: () {},
        ),
      ],
    );
  }
}
