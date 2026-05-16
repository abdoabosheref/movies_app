import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/exceptions/app_exceptions.dart';
import 'package:movies_app/domain/use_cases/movie_suggestions/movie_suggestions_use_case.dart';
import 'package:movies_app/features/movie_suggestions/cubit/movie_suggestions_states.dart';

@injectable
class MovieSuggestionsViewModel extends Cubit<MovieSuggestionsStates> {
  final MovieSuggestionsUseCase _movieSuggestionsUseCase;

  MovieSuggestionsViewModel(this._movieSuggestionsUseCase)
    : super(MovieSuggestionsInitialState());

  Future<void> fetchMovieSuggestions({required int movieId}) async {
    try {
      emit(MovieSuggestionsLoadingState());

      var movieSuggestionsResponse = await _movieSuggestionsUseCase.invoke(
        movieId: movieId,
      );
      emit(
        MovieSuggestionsSuccessState(
          movieSuggestions: movieSuggestionsResponse,
        ),
      );
    } on DioException catch (e) {
      String message = (e.error is AppException)
          ? (e.error as AppException).message
          : 'Something went wrong';
      emit(
        MovieSuggestionsErrorState(
          appException: ServerException(message: message),
        ),
      );
    } on AppException catch (e) {
      emit(
        MovieSuggestionsErrorState(
          appException: ServerException(message: e.message),
        ),
      );
    } catch (e) {
      emit(
        MovieSuggestionsErrorState(
          appException: UnexpectedException(message: e.toString()),
        ),
      );
    }
  }
}
