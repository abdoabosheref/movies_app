import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/api/models/movie_suggestions/movies_dto.dart';

part 'data_suggestions_dto.g.dart';

@JsonSerializable()
class DataSuggestionsDto {
  @JsonKey(name: "movie_count")
  final int? movieCount;
  @JsonKey(name: "movies")
  final List<MoviesDto>? movies;

  DataSuggestionsDto({this.movieCount, this.movies});

  factory DataSuggestionsDto.fromJson(Map<String, dynamic> json) {
    return _$DataSuggestionsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataSuggestionsDtoToJson(this);
  }
}
