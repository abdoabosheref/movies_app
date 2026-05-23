import 'package:movies_app/domain/entities/movie_response/movie_response.dart';

abstract class MovieSuggestionsRepository {
  Future<MovieResponse> fetchMovieSuggestions({required int movieId});
}
