import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/movie_suggestions/movie_suggestions.dart';
import 'package:movies_app/domain/repositories/movie_suggestions/movie_suggestions_repository.dart';

@injectable
class MovieSuggestionsUseCase {
  final MovieSuggestionsRepository _movieSuggestionsRepository;

  MovieSuggestionsUseCase(this._movieSuggestionsRepository);

  Future<MovieSuggestions> invoke({required int movieId}) {
    return _movieSuggestionsRepository.fetchMovieSuggestions(movieId: movieId);
  }
}
