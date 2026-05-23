// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataResponseDto _$DataResponseDtoFromJson(Map<String, dynamic> json) =>
    DataResponseDto(
      movieCount: (json['movie_count'] as num?)?.toInt(),
      movies: (json['movies'] as List<dynamic>?)
          ?.map((e) => MovieDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageNumber: (json['page_number'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataResponseDtoToJson(DataResponseDto instance) =>
    <String, dynamic>{
      'movie_count': instance.movieCount,
      'page_number': instance.pageNumber,
      'limit': instance.limit,
      'movies': instance.movies,
    };
