import 'package:movies_app/api/mappers/movie_details/data_mapper.dart';
import 'package:movies_app/api/models/movie_details/movie_details_response_dto.dart';
import 'package:movies_app/domain/entities/movie_details/movie_details_response.dart';

extension MovieDetailsResponseMapper on MovieDetailsResponseDto {
  MovieDetailsResponse toMovieDetailsResponse() {
    return MovieDetailsResponse(
      data: data?.toData(),
      status: status,
      statusMessage: statusMessage,
    );
  }
}
