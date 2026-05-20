import 'package:movies_app/api/mappers/movie_response/data_response_mapper.dart';
import 'package:movies_app/api/models/movie_response/movie_response_dto.dart';
import 'package:movies_app/domain/entities/movie_response/movie_response.dart';

extension MovieResponseMapper on MovieResponseDto {
  MovieResponse toMovieResponse() {
    return MovieResponse(
      data: data?.toDataResponse(),
      status: status,
      statusMessage: statusMessage,
    );
  }
}
