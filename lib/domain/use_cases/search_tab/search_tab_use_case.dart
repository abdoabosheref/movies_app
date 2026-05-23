import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movie_response/movie_response.dart';
import 'package:movies_app/domain/repositories/search_tab/search_tab_repository.dart';

@injectable
class SearchTabUseCase {
  final SearchTabRepository _searchTabRepository;

  SearchTabUseCase(this._searchTabRepository);
  Future<MovieResponse> invoke({String? genre, String? queryTerm, int page = 1}) {
    return _searchTabRepository.getMoviesList(genre: genre,page: page,queryTerm: queryTerm);
  }
}
