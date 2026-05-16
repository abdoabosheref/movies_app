// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataDto _$DataDtoFromJson(Map<String, dynamic> json) => DataDto(
  movie: json['movie'] == null
      ? null
      : MovieDto.fromJson(json['movie'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DataDtoToJson(DataDto instance) => <String, dynamic>{
  'movie': instance.movie,
};
