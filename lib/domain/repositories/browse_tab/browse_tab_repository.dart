import 'package:movies_app/domain/entities/movie_response/movie_response.dart';

abstract class BrowseTabRepository {
  Future<MovieResponse> getMoviesList({String? genre, String? queryTerm, int page = 1});
}
