import 'package:injectable/injectable.dart';
import 'package:movies_app/data/repositories/profile_tab/history/history_repository.dart';
import 'package:movies_app/domain/entities/movie_response/movie.dart';

@injectable
class GetMovieFromHistoryUseCase {
  final HistoryRepository _historyRepository;

  GetMovieFromHistoryUseCase(this._historyRepository);

  Future<List<Movie>> invoke() {
    return _historyRepository.getMovieHistory();
  }
}
