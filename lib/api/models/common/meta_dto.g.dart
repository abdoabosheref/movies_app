// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaDto _$MetaDtoFromJson(Map<String, dynamic> json) => MetaDto(
  apiVersion: (json['api_version'] as num?)?.toInt(),
  executionTime: json['execution_time'] as String?,
);

Map<String, dynamic> _$MetaDtoToJson(MetaDto instance) => <String, dynamic>{
  'api_version': instance.apiVersion,
  'execution_time': instance.executionTime,
};
