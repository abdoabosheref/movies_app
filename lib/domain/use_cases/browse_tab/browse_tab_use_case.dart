import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movie_response/movie_response.dart';
import 'package:movies_app/domain/repositories/browse_tab/browse_tab_repository.dart';

@injectable
class BrowseTabUseCase {
  final BrowseTabRepository _browseTabRepository;

  BrowseTabUseCase(this._browseTabRepository);
  Future<MovieResponse> invoke({String? genre, String? queryTerm, int page = 1}) {
    return _browseTabRepository.getMoviesList(genre: genre,page: page,queryTerm: queryTerm);
  }
}
