import 'package:movies_app/domain/entities/movie_details/movie_details.dart';

abstract class MovieDetailsRepository {
  Future<MovieDetails> fetchMovieDetails({required int movieId});
}
