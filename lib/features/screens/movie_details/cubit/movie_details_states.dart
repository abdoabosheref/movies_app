import 'package:movies_app/core/exceptions/app_exceptions.dart';
import 'package:movies_app/domain/entities/movie_details/movie_details_response.dart';

sealed class MovieDetailsState {}

class MovieDetailsInitialState extends MovieDetailsState {}

class MovieDetailsLoadingState extends MovieDetailsState {}

class MovieDetailsSuccessState extends MovieDetailsState {
  MovieDetailsResponse movieDetails;

  MovieDetailsSuccessState({required this.movieDetails});
}

class MovieDetailsErrorState extends MovieDetailsState {
  AppException appException;

  MovieDetailsErrorState({required this.appException});
}
