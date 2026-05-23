import 'package:injectable/injectable.dart';
import 'package:movies_app/api/api_services.dart';
import 'package:movies_app/api/mappers/movie_response/movie_response_mapper.dart';
import 'package:movies_app/data/data_sources/remote/search_tab/search_tab_remote_data_source.dart';
import 'package:movies_app/domain/entities/movie_response/movie_response.dart';

@Injectable(as: SearchTabRemoteDataSource)
class SearchTabRemoteDataSourceImpl
    implements SearchTabRemoteDataSource {
  final ApiServices _apiServices;

  SearchTabRemoteDataSourceImpl(this._apiServices);

  @override
  Future<MovieResponse> getMoviesList({String? genre, String? queryTerm, int page = 1}) async{
    final movieResponse = await _apiServices.getMoviesList(genre: genre,page: page,queryTerm: queryTerm);
    return movieResponse.toMovieResponse();
  }
}
