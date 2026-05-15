import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/api/models/movie_details/movie_dto.dart';

part 'data_dto.g.dart';

@JsonSerializable()
class DataDto {
  @JsonKey(name: "movie")
  final MovieDto? movie;

  DataDto({this.movie});

  factory DataDto.fromJson(Map<String, dynamic> json) {
    return _$DataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataDtoToJson(this);
  }
}
