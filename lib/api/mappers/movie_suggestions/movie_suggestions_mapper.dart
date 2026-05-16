import 'package:movies_app/api/mappers/movie_suggestions/data_suggestions_mapper.dart';
import 'package:movies_app/api/models/movie_suggestions/movie_suggestions_dto.dart';
import 'package:movies_app/domain/entities/movie_suggestions/movie_suggestions.dart';

extension MovieSuggestionsMapper on MovieSuggestionsDto {
  MovieSuggestions toMovieSuggestions() {
    return MovieSuggestions(
      data: data?.toDataSuggestions(),
      status: status,
      statusMessage: statusMessage,
    );
  }
}
