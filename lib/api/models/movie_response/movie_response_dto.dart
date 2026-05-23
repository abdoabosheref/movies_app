import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/api/models/common/meta_dto.dart';
import 'package:movies_app/api/models/movie_response/data_response_dto.dart';

part 'movie_response_dto.g.dart';

@JsonSerializable()
class MovieResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "status_message")
  final String? statusMessage;
  @JsonKey(name: "data")
  final DataResponseDto? data;
  @JsonKey(name: "metaDto")
  final MetaDto? metaDto;

  MovieResponseDto({
    this.status,
    this.statusMessage,
    this.data,
    this.metaDto,
  });

  factory MovieResponseDto.fromJson(Map<String, dynamic> json) {
    return _$MovieResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MovieResponseDtoToJson(this);
  }
}
