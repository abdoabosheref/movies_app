import 'package:movies_app/api/mappers/movie_response/movie_mapper.dart';
import 'package:movies_app/api/models/movie_response/data_response_dto.dart';
import 'package:movies_app/domain/entities/movie_response/data_response.dart';

extension DataResponseMapper on DataResponseDto {
  DataResponse toDataResponse() {
    return DataResponse(
      movies: movies?.map((movie) => movie.toMovie()).toList(),
      movieCount: movieCount,
      limit: limit,
      pageNumber: pageNumber
    );
  }
}
