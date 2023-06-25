// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginCredentialsDto _$LoginCredentialsDtoFromJson(Map<String, dynamic> json) =>
    LoginCredentialsDto(
      json['userName'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$LoginCredentialsDtoToJson(
        LoginCredentialsDto instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'password': instance.password,
    };

RegisterCredentialsDto _$RegisterCredentialsDtoFromJson(
        Map<String, dynamic> json) =>
    RegisterCredentialsDto(
      json['userName'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$RegisterCredentialsDtoToJson(
        RegisterCredentialsDto instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'password': instance.password,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      json['token'] as String,
      json['userId'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'userId': instance.userId,
    };
