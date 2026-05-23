import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/exceptions/app_exceptions.dart';
import 'package:movies_app/domain/entities/movie_response/movie.dart';
import 'package:movies_app/domain/use_cases/profile_tab/history/add_movie_to_history_use_case.dart';

import 'history_states.dart';

@injectable
class HistoryViewModel extends Cubit<HistoryStates> {
  final AddMovieToHistoryUseCase _addMovieToHistoryUseCase;

  HistoryViewModel(this._addMovieToHistoryUseCase)
    : super(HistoryInitialState());
  Future<void> addMovieToHistory({required Movie movie}) async {
    try {
      emit(HistoryLoadingState());
      await _addMovieToHistoryUseCase.invoke(movie: movie);
      emit(HistorySuccessState());
    } catch (e,stackTrace) {
      print("🛑 HISTORY CUBIT ERROR: $e");
      print("🛑 STACK TRACE: $stackTrace");
      emit(
        HistoryErrorState(
          appException: UnexpectedException(message: e.toString()),
        ),
      );
    }
  }
}
