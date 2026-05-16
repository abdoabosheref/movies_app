import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/api/models/common/meta_dto.dart';
import 'package:movies_app/api/models/movie_suggestions/data_suggestions_dto.dart';

part 'movie_suggestions_dto.g.dart';

@JsonSerializable()
class MovieSuggestionsDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "status_message")
  final String? statusMessage;
  @JsonKey(name: "data")
  final DataSuggestionsDto? data;
  @JsonKey(name: "metaDto")
  final MetaDto? metaDto;

  MovieSuggestionsDto({
    this.status,
    this.statusMessage,
    this.data,
    this.metaDto,
  });

  factory MovieSuggestionsDto.fromJson(Map<String, dynamic> json) {
    return _$MovieSuggestionsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MovieSuggestionsDtoToJson(this);
  }
}
