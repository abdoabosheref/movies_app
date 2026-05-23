import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/exceptions/app_exceptions.dart';
import 'package:movies_app/domain/entities/movie_response/movie.dart';
import 'package:movies_app/domain/use_cases/browse_tab/browse_tab_use_case.dart';

import 'browse_tab_states.dart';

@injectable
class BrowseTabViewModel extends Cubit<BrowseTabStates> {
  List<Movie>? movieList;
  int selectedIndex = 0;

  final BrowseTabUseCase _browseTabUseCase;

  BrowseTabViewModel(this._browseTabUseCase)
    : super(BrowseTabInitialState());

Future<void> getMoviesList({String? genre, String? queryTerm, int page = 1})async{
    try {
      emit(BrowseTabLoadingState());

      var movieResponse = await _browseTabUseCase.invoke(
        genre: genre,
        queryTerm: queryTerm,
        page: page,
      );
      movieList = movieResponse.data?.movies;
      emit(
        BrowseTabSuccessState(
        ),
      );
    } on DioException catch (e) {
      String message = (e.error is AppException)
          ? (e.error as AppException).message
          : 'Something went wrong';
      emit(
        BrowseTabErrorState(
          appException: ServerException(message: message),
        ),
      );
    } on AppException catch (e) {
      emit(
        BrowseTabErrorState(
          appException: ServerException(message: e.message),
        ),
      );
    } catch (e) {
      emit(
        BrowseTabErrorState(
          appException: UnexpectedException(message: e.toString()),
        ),
      );
    }
  }
  void changeSelectedIndex({required int currentIndex}) {
  if (selectedIndex == currentIndex) return;
    selectedIndex = currentIndex;
    emit(BrowseTabChangeSelectedIndexState());
  }
  bool isSelected({required int currentIndex}) => selectedIndex == currentIndex;
}
