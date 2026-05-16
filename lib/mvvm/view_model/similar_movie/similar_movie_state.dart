import 'package:movies_app/core/api/movie_response.dart';

abstract class SimilarMoviesState {}

class SimilarMoviesInitial extends SimilarMoviesState {}

class SimilarMoviesLoading extends SimilarMoviesState {}

class SimilarMoviesSuccess extends SimilarMoviesState {
  final List<Movies> movies;
  SimilarMoviesSuccess(this.movies);
}

class SimilarMoviesError extends SimilarMoviesState {
  final String errorMessage;
  SimilarMoviesError(this.errorMessage);
}