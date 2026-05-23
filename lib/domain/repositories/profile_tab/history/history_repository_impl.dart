import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_sources/remote/profile_tab/history/history_remote_data_source.dart';
import 'package:movies_app/data/repositories/profile_tab/history/history_repository.dart';
import 'package:movies_app/domain/entities/movie_response/movie.dart';

@Injectable(as: HistoryRepository)
class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryRemoteDataSource _historyRemoteDataSource;
  HistoryRepositoryImpl(this._historyRemoteDataSource);

  @override
  Future<void> addMovieToHistory({required Movie movie}) async {
    return _historyRemoteDataSource.addMovieToHistory(movie: movie);
  }

  // @override
  // Future<List<Movie>> getMovieHistory() async {
  //   final firebaseMovies = await historyRemoteDataSource.getMovieHistory();
  //   return firebaseMovies.map((model) => FirebaseMovieMapper.toEntity(model)).toList();
  // }
}