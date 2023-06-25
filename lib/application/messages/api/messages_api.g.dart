// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMessageDto _$GetMessageDtoFromJson(Map<String, dynamic> json) =>
    GetMessageDto(
      json['roomId'] as String,
      json['messageId'] as String,
    );

Map<String, dynamic> _$GetMessageDtoToJson(GetMessageDto instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'messageId': instance.messageId,
    };
