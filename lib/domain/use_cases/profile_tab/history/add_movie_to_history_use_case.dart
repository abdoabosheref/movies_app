import 'package:injectable/injectable.dart';
import 'package:movies_app/data/repositories/profile_tab/history/history_repository.dart';
import 'package:movies_app/domain/entities/movie_response/movie.dart';

@injectable
class AddMovieToHistoryUseCase {
  final HistoryRepository _historyRepository;

  AddMovieToHistoryUseCase(this._historyRepository);

  Future<void> invoke({required Movie movie}) {
    return _historyRepository.addMovieToHistory(movie: movie);
  }
}
