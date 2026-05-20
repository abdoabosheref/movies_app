import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_sources/remote/browse_tab/browse_tab_remote_data_source.dart';
import 'package:movies_app/domain/entities/movie_response/movie_response.dart';
import 'package:movies_app/domain/repositories/browse_tab/browse_tab_repository.dart';

@Injectable(as: BrowseTabRepository)
class BrowseTabRepositoryImpl implements BrowseTabRepository {
  final BrowseTabRemoteDataSource _browseTabRemoteDataSource ;

  BrowseTabRepositoryImpl(this._browseTabRemoteDataSource);



  @override
  Future<MovieResponse> getMoviesList({String? genre, String? queryTerm, int page = 1}) {
   return _browseTabRemoteDataSource.getMoviesList(queryTerm: queryTerm,page: page,genre: genre);
  }
}
