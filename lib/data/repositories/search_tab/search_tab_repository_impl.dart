import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_sources/remote/search_tab/search_tab_remote_data_source.dart';
import 'package:movies_app/domain/entities/movie_response/movie_response.dart';
import 'package:movies_app/domain/repositories/search_tab/search_tab_repository.dart';

@Injectable(as: SearchTabRepository)
class SearchTabRepositoryImpl implements SearchTabRepository {
  final SearchTabRemoteDataSource _searchTabRemoteDataSource ;

  SearchTabRepositoryImpl(this._searchTabRemoteDataSource);



  @override
  Future<MovieResponse> getMoviesList({String? genre, String? queryTerm, int page = 1}) {
   return _searchTabRemoteDataSource.getMoviesList(queryTerm: queryTerm,page: page,genre: genre);
  }
}
