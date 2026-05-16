import 'package:movies_app/api/models/movie_suggestions/movies_dto.dart';
import 'package:movies_app/domain/entities/movie_suggestions/movies.dart';

extension MoviesMapper on MoviesDto {
  Movies toMovies() {
    return Movies(
      id: id,
      rating: rating,
      mediumCoverImage: mediumCoverImage,
      url: url,
    );
  }
}
