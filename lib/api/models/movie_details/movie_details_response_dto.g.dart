// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsResponseDto _$MovieDetailsResponseDtoFromJson(
  Map<String, dynamic> json,
) => MovieDetailsResponseDto(
  status: json['status'] as String?,
  statusMessage: json['status_message'] as String?,
  data: json['data'] == null
      ? null
      : DataDto.fromJson(json['data'] as Map<String, dynamic>),
  metaDto: json['metaDto'] == null
      ? null
      : MetaDto.fromJson(json['metaDto'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MovieDetailsResponseDtoToJson(
  MovieDetailsResponseDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'status_message': instance.statusMessage,
  'data': instance.data,
  'metaDto': instance.metaDto,
};
