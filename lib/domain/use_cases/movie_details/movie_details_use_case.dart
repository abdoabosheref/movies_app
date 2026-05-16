import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movie_details/movie_details.dart';
import 'package:movies_app/domain/repositories/movie_details/movie_details_repository.dart';

@injectable
class MovieDetailsUseCase {
  final MovieDetailsRepository _movieDetailsRepository;

  MovieDetailsUseCase(this._movieDetailsRepository);

  Future<MovieDetails> invoke({required int movieId}) {
    return _movieDetailsRepository.fetchMovieDetails(movieId: movieId);
  }
}
