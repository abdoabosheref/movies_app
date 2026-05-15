import 'package:dio/dio.dart';
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
}
