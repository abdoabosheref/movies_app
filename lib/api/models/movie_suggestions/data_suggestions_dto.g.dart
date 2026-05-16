// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_suggestions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataSuggestionsDto _$DataSuggestionsDtoFromJson(Map<String, dynamic> json) =>
    DataSuggestionsDto(
      movieCount: (json['movie_count'] as num?)?.toInt(),
      movies: (json['movies'] as List<dynamic>?)
          ?.map((e) => MoviesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataSuggestionsDtoToJson(DataSuggestionsDto instance) =>
    <String, dynamic>{
      'movie_count': instance.movieCount,
      'movies': instance.movies,
    };
