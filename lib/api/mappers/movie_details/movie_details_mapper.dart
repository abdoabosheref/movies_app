import 'package:movies_app/api/mappers/movie_details/data_mapper.dart';
import 'package:movies_app/api/models/movie_details/movie_details_dto.dart';
import 'package:movies_app/domain/entities/movie_details/movie_details.dart';

extension MovieDetailsMapper on MovieDetailsDto {
  MovieDetails toMovieDetails() {
    return MovieDetails(
      data: data?.toData(),
      status: status,
      statusMessage: statusMessage,
    );
  }
}
