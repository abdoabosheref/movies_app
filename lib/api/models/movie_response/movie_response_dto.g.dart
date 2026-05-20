// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponseDto _$MovieResponseDtoFromJson(Map<String, dynamic> json) =>
    MovieResponseDto(
      status: json['status'] as String?,
      statusMessage: json['status_message'] as String?,
      data: json['data'] == null
          ? null
          : DataResponseDto.fromJson(json['data'] as Map<String, dynamic>),
      metaDto: json['metaDto'] == null
          ? null
          : MetaDto.fromJson(json['metaDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieResponseDtoToJson(MovieResponseDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'status_message': instance.statusMessage,
      'data': instance.data,
      'metaDto': instance.metaDto,
    };
