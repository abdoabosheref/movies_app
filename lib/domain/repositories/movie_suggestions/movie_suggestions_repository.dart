import 'package:movies_app/domain/entities/movie_suggestions/movie_suggestions.dart';

abstract class MovieSuggestionsRepository {
  Future<MovieSuggestions> fetchMovieSuggestions({required int movieId});
}
