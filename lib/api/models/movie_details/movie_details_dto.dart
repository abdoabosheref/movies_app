import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/api/models/movie_details/data_dto.dart';
import 'package:movies_app/api/models/movie_details/meta_dto.dart';

part 'movie_details_dto.g.dart';

@JsonSerializable()
class MovieDetailsDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "status_message")
  final String? statusMessage;
  @JsonKey(name: "data")
  final DataDto? data;
  @JsonKey(name: "metaDto")
  final MetaDto? metaDto;

  MovieDetailsDto({this.status, this.statusMessage, this.data, this.metaDto});

  factory MovieDetailsDto.fromJson(Map<String, dynamic> json) {
    return _$MovieDetailsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MovieDetailsDtoToJson(this);
  }
}
