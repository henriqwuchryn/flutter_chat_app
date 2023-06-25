// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchPasswordDto _$PatchPasswordDtoFromJson(Map<String, dynamic> json) =>
    PatchPasswordDto(
      json['oldPassword'] as String,
      json['newPassword'] as String,
    );

Map<String, dynamic> _$PatchPasswordDtoToJson(PatchPasswordDto instance) =>
    <String, dynamic>{
      'oldPassword': instance.oldPassword,
      'newPassword': instance.newPassword,
    };
