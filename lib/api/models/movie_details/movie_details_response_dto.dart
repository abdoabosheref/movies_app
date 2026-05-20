import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/api/models/common/meta_dto.dart';
import 'package:movies_app/api/models/movie_details/data_dto.dart';

part 'movie_details_response_dto.g.dart';

@JsonSerializable()
class MovieDetailsResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "status_message")
  final String? statusMessage;
  @JsonKey(name: "data")
  final DataDto? data;
  @JsonKey(name: "metaDto")
  final MetaDto? metaDto;

  MovieDetailsResponseDto({this.status, this.statusMessage, this.data, this.metaDto});

  factory MovieDetailsResponseDto.fromJson(Map<String, dynamic> json) {
    return _$MovieDetailsResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MovieDetailsResponseDtoToJson(this);
  }
}
