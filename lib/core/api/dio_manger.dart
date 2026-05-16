import 'package:dio/dio.dart';
import 'package:movies_app/core/api/api_constant.dart';
import 'package:movies_app/core/api/end_points.dart';
import 'package:movies_app/core/api/movie_response.dart';

class DioManger {
  //https://movies-api.accel.li/api/v2/movie_suggestions.json

  static final dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  static Future<MovieResponse> getMovieSuggestionsByMovieId(int movie_id,) async {
    try {
      var response = await dio.get(
        EndPoints.movie_suggestions,
        queryParameters: {"movie_id": movie_id},
      );

      return MovieResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
