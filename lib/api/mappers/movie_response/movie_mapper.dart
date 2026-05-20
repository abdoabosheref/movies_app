import 'package:movies_app/api/models/movie_response/movie_dto.dart';
import 'package:movies_app/domain/entities/movie_response/movie.dart';

extension MovieMapper on MovieDto {
  Movie toMovie() {
    return Movie(
      id: id,
      rating: rating,
      mediumCoverImage: mediumCoverImage,
      url: url,
    );
  }
}
