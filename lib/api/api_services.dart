import 'package:dio/dio.dart';
import 'package:movies_app/api/models/movie_suggestions/movie_suggestions_dto.dart';

import 'end_points.dart';
import 'models/movie_details/movie_details_dto.dart';

class ApiServices {
  final Dio _dio;

  ApiServices(this._dio);

  Future<MovieDetailsDto> fetchMovieDetails({required int movieId}) async {
    try {
      final response = await _dio.get(
        EndPoints.movieDetailsEndPoint,
        queryParameters: {
          'movie_id': movieId,
          'with_images': true,
          'with_cast': true,
        },
      );
      return MovieDetailsDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<MovieSuggestionsDto> fetchMovieSuggestions({
    required int movieId,
  }) async {
    try {
      final response = await _dio.get(
        EndPoints.movieSuggestionsEndPoint,
        queryParameters: {'movie_id': movieId},
      );
      return MovieSuggestionsDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
