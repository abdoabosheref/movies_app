import 'package:movies_app/api/mappers/movie_details/cast_mapper.dart';
import 'package:movies_app/api/models/movie_details/movie_details_dto.dart';
import 'package:movies_app/domain/entities/movie_details/movie_details.dart';

extension MovieDetailsMapper on MovieDetailsDto {
  MovieDetails toMovieDetails() {
    return MovieDetails(
      url: url,
      title: title,
      backgroundImage: backgroundImage,
      cast: cast?.map((castDto) => castDto.toCast()).toList(),
      descriptionIntro: descriptionIntro,
      genres: genres,
      id: id,
      likeCount: likeCount,
      mediumCoverImage: mediumCoverImage,
      mediumScreenshotImage1: mediumScreenshotImage1,
      mediumScreenshotImage2: mediumScreenshotImage2,
      mediumScreenshotImage3: mediumScreenshotImage3,
      rating: rating,
      runtime: runtime,
      year: year,
    );
  }
}
