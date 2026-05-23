import 'package:dio/dio.dart';
import 'package:movies_app/api/models/movie_response/movie_response_dto.dart';

import 'end_points.dart';
import 'models/movie_details/movie_details_response_dto.dart';

class ApiServices {
  final Dio _dio;

  ApiServices(this._dio);

  Future<MovieDetailsResponseDto> fetchMovieDetails({required int movieId}) async {
    try {
      final response = await _dio.get(
        EndPoints.movieDetailsEndPoint,
        queryParameters: {
          'movie_id': movieId,
          'with_images': true,
          'with_cast': true,
        },
      );
      return MovieDetailsResponseDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }


  Future<MovieResponseDto> fetchMovieSuggestions({
    required int movieId,
  }) async {
    try {
      final response = await _dio.get(
        EndPoints.movieSuggestionsEndPoint,
        queryParameters: {'movie_id': movieId},
      );
      return MovieResponseDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<MovieResponseDto> getMoviesList({String? genre, String? queryTerm, int page = 1}) async {
    try {
      final Map<String,dynamic> queryParameters = {
        'page':page
      };
      if(genre != null && genre != 'All' && genre.trim().isNotEmpty){
        queryParameters['genre'] = genre;
      }
      if(queryTerm != null&&queryTerm.trim().isNotEmpty){
        queryParameters['query_term'] = queryTerm;
      }
      final response = await _dio.get(
          EndPoints.listMoviesEndPoint,
          queryParameters:queryParameters
      );
      return MovieResponseDto.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
