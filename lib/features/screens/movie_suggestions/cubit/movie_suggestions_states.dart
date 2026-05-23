import 'package:movies_app/core/exceptions/app_exceptions.dart';
import 'package:movies_app/domain/entities/movie_response/movie_response.dart';

sealed class MovieSuggestionsStates {}

class MovieSuggestionsInitialState extends MovieSuggestionsStates {}

class MovieSuggestionsLoadingState extends MovieSuggestionsStates {}

class MovieSuggestionsSuccessState extends MovieSuggestionsStates {
  MovieResponse movieResponse;

  MovieSuggestionsSuccessState({required this.movieResponse});
}

class MovieSuggestionsErrorState extends MovieSuggestionsStates {
  AppException appException;

  MovieSuggestionsErrorState({required this.appException});
}
