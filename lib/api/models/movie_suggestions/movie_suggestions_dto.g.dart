// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_suggestions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieSuggestionsDto _$MovieSuggestionsDtoFromJson(Map<String, dynamic> json) =>
    MovieSuggestionsDto(
      status: json['status'] as String?,
      statusMessage: json['status_message'] as String?,
      data: json['data'] == null
          ? null
          : DataSuggestionsDto.fromJson(json['data'] as Map<String, dynamic>),
      metaDto: json['metaDto'] == null
          ? null
          : MetaDto.fromJson(json['metaDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieSuggestionsDtoToJson(
  MovieSuggestionsDto instance,
) => <String, dynamic>{
  'status': instance.status,
  'status_message': instance.statusMessage,
  'data': instance.data,
  'metaDto': instance.metaDto,
};
