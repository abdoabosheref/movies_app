import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api/dio_manger.dart';
import 'package:movies_app/mvvm/view_model/similar_movie/similar_movie_state.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit() : super(SimilarMoviesInitial());

  void getSimilarMovies(int movieId) async {
    emit(SimilarMoviesLoading());
    try {
      final response = await DioManger.getMovieSuggestionsByMovieId(movieId);

      if (response.data != null && response.data!.movies != null) {
        emit(SimilarMoviesSuccess(response.data!.movies!));
      } else {
        emit(SimilarMoviesError("No similar movies found"));
      }
    } catch (e) {
      emit(SimilarMoviesError(e.toString()));
    }
  }
}