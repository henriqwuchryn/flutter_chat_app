// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['Id'] as String,
      json['UserName'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'Id': instance.Id,
      'UserName': instance.UserName,
    };

UserListItem _$UserListItemFromJson(Map<String, dynamic> json) => UserListItem(
      json['userName'] as String,
      json['id'] as String,
    );

Map<String, dynamic> _$UserListItemToJson(UserListItem instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'id': instance.id,
    };
