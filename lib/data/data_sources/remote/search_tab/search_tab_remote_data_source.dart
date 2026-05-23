
import 'package:movies_app/domain/entities/movie_response/movie_response.dart';

abstract class SearchTabRemoteDataSource {
  Future<MovieResponse> getMoviesList({String? genre, String? queryTerm, int page = 1});
}
