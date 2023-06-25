// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      UserListItem.fromJson(json['author'] as Map<String, dynamic>),
      json['body'] as String,
      DateTime.parse(json['createdAt'] as String),
      json['roomId'] as String,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'author': instance.author,
      'body': instance.body,
      'createdAt': instance.createdAt.toIso8601String(),
      'roomId': instance.roomId,
    };
