import 'package:json_annotation/json_annotation.dart';

part 'meta_dto.g.dart';

@JsonSerializable()
class MetaDto {
  @JsonKey(name: "api_version")
  final int? apiVersion;
  @JsonKey(name: "execution_time")
  final String? executionTime;

  MetaDto({this.apiVersion, this.executionTime});

  factory MetaDto.fromJson(Map<String, dynamic> json) {
    return _$MetaDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetaDtoToJson(this);
  }
}
