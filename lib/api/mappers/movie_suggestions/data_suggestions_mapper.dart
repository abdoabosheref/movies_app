import 'package:movies_app/api/mappers/movie_suggestions/movies_mapper.dart';
import 'package:movies_app/api/models/movie_suggestions/data_suggestions_dto.dart';
import 'package:movies_app/domain/entities/movie_suggestions/data_suggestions.dart';

extension DataSuggestionsMapper on DataSuggestionsDto {
  DataSuggestions toDataSuggestions() {
    return DataSuggestions(
      movies: movies?.map((movie) => movie.toMovies()).toList(),
      movieCount: movieCount,
    );
  }
}
