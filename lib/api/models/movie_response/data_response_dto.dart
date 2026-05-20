import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/api/models/movie_response/movie_dto.dart';

part 'data_response_dto.g.dart';

@JsonSerializable()
class DataResponseDto {
  @JsonKey(name: "movie_count")
  final int? movieCount;
  @JsonKey(name: "page_number")
  final int? pageNumber;
  @JsonKey(name: "limit")
  final int? limit;
  @JsonKey(name: "movies")
  final List<MovieDto>? movies;

  DataResponseDto({this.movieCount, this.movies, this.pageNumber, this.limit});

  factory DataResponseDto.fromJson(Map<String, dynamic> json) {
    return _$DataResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataResponseDtoToJson(this);
  }
}
