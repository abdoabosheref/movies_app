import 'package:movies_app/domain/entities/movie_details/movie_details_response.dart';

abstract class MovieDetailsRepository {
  Future<MovieDetailsResponse> fetchMovieDetails({required int movieId});
}
