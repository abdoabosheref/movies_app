import 'package:injectable/injectable.dart';
import 'package:movies_app/api/api_services.dart';
import 'package:movies_app/api/mappers/movie_response/movie_response_mapper.dart';
import 'package:movies_app/data/data_sources/remote/movie_suggestions/movie_suggestions_remote_data_source.dart';
import 'package:movies_app/domain/entities/movie_response/movie_response.dart';

@Injectable(as: MovieSuggestionsRemoteDataSource)
class MovieSuggestionsRemoteDataSourceImpl
    implements MovieSuggestionsRemoteDataSource {
  final ApiServices _apiServices;

  MovieSuggestionsRemoteDataSourceImpl(this._apiServices);

  @override
  Future<MovieResponse> fetchMovieSuggestions({required int movieId}) async {
    final movieSuggestionsResponse = await _apiServices.fetchMovieSuggestions(
      movieId: movieId,
    );
    return movieSuggestionsResponse.toMovieResponse();
  }
}
