// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rooms_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostRoomDto _$PostRoomDtoFromJson(Map<String, dynamic> json) => PostRoomDto(
      json['name'] as String,
      json['description'] as String,
    );

Map<String, dynamic> _$PostRoomDtoToJson(PostRoomDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };

PatchRoomDto _$PatchRoomDtoFromJson(Map<String, dynamic> json) => PatchRoomDto(
      json['name'] as String,
      json['description'] as String,
    );

Map<String, dynamic> _$PatchRoomDtoToJson(PatchRoomDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };
