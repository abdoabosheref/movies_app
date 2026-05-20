import '../../../../domain/entities/movie_details/movie_details_response.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<MovieDetailsResponse> fetchMovieDetails({required int movieId});
}
