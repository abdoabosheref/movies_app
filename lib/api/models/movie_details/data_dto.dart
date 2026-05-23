import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/api/models/movie_details/movie_details_dto.dart';

part 'data_dto.g.dart';

@JsonSerializable()
class DataDto {
  @JsonKey(name: "movie")
  final MovieDetailsDto? movie;

  DataDto({this.movie});

  factory DataDto.fromJson(Map<String, dynamic> json) {
    return _$DataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataDtoToJson(this);
  }
}
