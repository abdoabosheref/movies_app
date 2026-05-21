import 'package:movies_app/core/exceptions/app_exceptions.dart';
import 'package:movies_app/domain/entities/movie_response/movie.dart';

sealed class SearchTabStates {}

class SearchTabInitialState extends SearchTabStates {}

class SearchTabLoadingState extends SearchTabStates {}

class SearchTabSuccessState extends SearchTabStates {
  final List<Movie> newMovies;
  SearchTabSuccessState({required this.newMovies});
}
class SearchTabErrorState extends SearchTabStates {
  AppException appException;

  SearchTabErrorState({required this.appException});
}
