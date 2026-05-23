import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/exceptions/app_exceptions.dart';
import 'package:movies_app/domain/entities/movie_response/movie.dart';
import 'package:movies_app/domain/use_cases/profile_tab/history/add_movie_to_history_use_case.dart';
import 'package:movies_app/domain/use_cases/profile_tab/history/get_movie_from_history_use_case.dart';

import 'history_states.dart';

@injectable
class HistoryViewModel extends Cubit<HistoryStates> {
  final AddMovieToHistoryUseCase _addMovieToHistoryUseCase;
  final GetMovieFromHistoryUseCase _getMovieFromHistoryUseCase;
  List<Movie> historyMovies = [];
  int historyCount = 0;

  HistoryViewModel(this._addMovieToHistoryUseCase,this._getMovieFromHistoryUseCase)
    : super(HistoryInitialState());
  Future<void> addMovieToHistory({required Movie movie}) async {
    try {
      emit(HistoryLoadingState());
      await _addMovieToHistoryUseCase.invoke(movie: movie);
      emit(HistorySuccessState());
    } catch (e) {
      emit(
        HistoryErrorState(
          appException: UnexpectedException(message: e.toString()),
        ),
      );
    }
  }
  Future<void> getMovieHistory() async {
    try {
      emit(HistoryLoadingState());
      final List<Movie> movies = await _getMovieFromHistoryUseCase.invoke();
      historyMovies = movies;
      historyCount = historyMovies.length;
      emit(HistorySuccessState());
    } catch (e) {
      emit(
        HistoryErrorState(
          appException: UnexpectedException(message: e.toString()),
        ),
      );
    }
  }

  int get getHistoryCount=> historyMovies.length;

}
