import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api_dio_home_tab/dio_manager.dart';
import 'package:movies_app/features/home_tab/data/models/movies_genre.dart';
import 'package:movies_app/features/home_tab/data/models/movies_list_response.dart';
import 'package:movies_app/features/home_tab/presentation/cubit/home_tab_state.dart';

class HomeTabCubit extends Cubit<HomeTabState> {
  HomeTabCubit() : super(InitState());
  String genreShuffle = MoviesGenre.shuffleGenre();
  List<Movies> movies = [];
  List<Movies> moviesByGenre = [];

  Future<void> loadHomeTabData() async {
    try {
      emit(HomeLoadingState());

      final availableNowResponse = await DioManager.getMoviesList();
      final genreResponse = await DioManager.getMoviesListByGenre(genreShuffle);

      if (availableNowResponse.status == 'ok' && genreResponse.status == 'ok') {
        movies = availableNowResponse.data!.movies!;
        moviesByGenre = genreResponse.data!.movies!;

        emit(
          HomeSuccessState(
            movies: movies,
            moviesByGenre: moviesByGenre,
            genreShuffle: genreShuffle,
          ),
        );
      } else {
        emit(HomeErrorState(errorMessage: 'Failed to load data from server.'));
      }
    } catch (e) {
      if (e is DioException) {
        emit(
          HomeErrorState(errorMessage: e.message ?? 'Network error occurred'),
        );
      } else {
        emit(HomeErrorState(errorMessage: e.toString()));
      }
    }
  }
}
