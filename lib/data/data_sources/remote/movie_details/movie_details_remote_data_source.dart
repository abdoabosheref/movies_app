import '../../../../domain/entities/movie_details/movie_details.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<MovieDetails> fetchMovieDetails({required int movieId});
}
