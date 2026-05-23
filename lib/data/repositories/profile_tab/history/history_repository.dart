import 'package:movies_app/domain/entities/movie_response/movie.dart';

abstract class HistoryRepository {
  Future<void> addMovieToHistory({required Movie movie});
// Future<List<Movie>> getMovieHistory();
}