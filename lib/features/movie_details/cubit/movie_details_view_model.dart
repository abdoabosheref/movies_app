import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/exceptions/app_exceptions.dart';
import 'package:movies_app/features/movie_details/cubit/movie_details_states.dart';

import '../../../domain/use_cases/movie_details/movie_details_use_case.dart';

@injectable
class MovieDetailsViewModel extends Cubit<MovieDetailsState> {
  final MovieDetailsUseCase _movieDetailsUseCase;

  MovieDetailsViewModel(this._movieDetailsUseCase)
    : super(MovieDetailsInitialState());

  Future<void> fetchMovieDetails({required int movieId}) async {
    try {
      emit(MovieDetailsLoadingState());

      var movieDetailsResponse = await _movieDetailsUseCase.invoke(
        movieId: movieId,
      );
      emit(MovieDetailsSuccessState(movieDetails: movieDetailsResponse));
    } on DioException catch (e) {
      String message = (e.error is AppException)
          ? (e.error as AppException).message
          : 'Something went wrong';
      emit(
        MovieDetailsErrorState(appException: ServerException(message: message)),
      );
    } on AppException catch (e) {
      emit(
        MovieDetailsErrorState(
          appException: ServerException(message: e.message),
        ),
      );
    } catch (e) {
      emit(
        MovieDetailsErrorState(
          appException: UnexpectedException(message: e.toString()),
        ),
      );
    }
  }
}
