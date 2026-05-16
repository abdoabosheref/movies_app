import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_sources/remote/movie_suggestions/movie_suggestions_remote_data_source.dart';
import 'package:movies_app/domain/entities/movie_suggestions/movie_suggestions.dart';
import 'package:movies_app/domain/repositories/movie_suggestions/movie_suggestions_repository.dart';

@Injectable(as: MovieSuggestionsRepository)
class MovieSuggestionsRepositoryImpl implements MovieSuggestionsRepository {
  final MovieSuggestionsRemoteDataSource _movieSuggestionsRemoteDataSource;

  MovieSuggestionsRepositoryImpl(this._movieSuggestionsRemoteDataSource);

  @override
  Future<MovieSuggestions> fetchMovieSuggestions({required int movieId}) {
    return _movieSuggestionsRemoteDataSource.fetchMovieSuggestions(
      movieId: movieId,
    );
  }
}
