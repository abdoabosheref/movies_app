import 'package:movies_app/core/exceptions/app_exceptions.dart';
import 'package:movies_app/domain/entities/movie_suggestions/movie_suggestions.dart';

sealed class MovieSuggestionsStates {}

class MovieSuggestionsInitialState extends MovieSuggestionsStates {}

class MovieSuggestionsLoadingState extends MovieSuggestionsStates {}

class MovieSuggestionsSuccessState extends MovieSuggestionsStates {
  MovieSuggestions movieSuggestions;

  MovieSuggestionsSuccessState({required this.movieSuggestions});
}

class MovieSuggestionsErrorState extends MovieSuggestionsStates {
  AppException appException;

  MovieSuggestionsErrorState({required this.appException});
}
