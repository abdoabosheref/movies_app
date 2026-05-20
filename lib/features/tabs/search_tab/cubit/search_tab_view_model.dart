import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/exceptions/app_exceptions.dart';
import 'package:movies_app/domain/entities/movie_response/movie.dart';
import 'package:movies_app/domain/use_cases/search_tab/search_tab_use_case.dart';

import 'search_tab_states.dart';

@injectable
class SearchTabViewModel extends Cubit<SearchTabStates> {
  List<Movie>? movieList;

  final SearchTabUseCase _searchTabUseCase;

  SearchTabViewModel(this._searchTabUseCase)
    : super(SearchTabInitialState());

Future<void> getMoviesList({String? genre, String? queryTerm, int page = 1})async{
    try {
      emit(SearchTabLoadingState());

      var movieResponse = await _searchTabUseCase.invoke(
        genre: genre,
        queryTerm: queryTerm,
        page: page,
      );
      movieList = movieResponse.data?.movies;
      emit(
        SearchTabSuccessState(
        ),
      );
    } on DioException catch (e) {
      String message = (e.error is AppException)
          ? (e.error as AppException).message
          : 'Something went wrong';
      emit(
        SearchTabErrorState(
          appException: ServerException(message: message),
        ),
      );
    } on AppException catch (e) {
      emit(
        SearchTabErrorState(
          appException: ServerException(message: e.message),
        ),
      );
    } catch (e) {
      emit(
        SearchTabErrorState(
          appException: UnexpectedException(message: e.toString()),
        ),
      );
    }
  }

}
