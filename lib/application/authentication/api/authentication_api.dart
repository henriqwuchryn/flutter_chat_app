import 'dart:convert';
import 'dart:io';
import 'package:chatzera/application/api.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'authentication_api.g.dart';

class AuthenticationApi {
  HttpClient httpClient = HttpClient();

  Future<LoginResponse> login(LoginCredentialsDto credentials) async {
    var requestBody = jsonEncode(credentials.toJson());
    http.Response response = await http.post(Uri.parse("$baseUrl/Auth/Login"),
        body: requestBody,
        headers: {
          "content-type": "application/json",
          "accept": "application/json"
        });
    String responseBody = response.body;
    Map<String, dynamic> responseBodyMap = jsonDecode(responseBody);
    var loginresponse = LoginResponse.fromJson(responseBodyMap);
    return loginresponse;
  }
}

@JsonSerializable()
class LoginCredentialsDto {
  final String username;
  final String password;

  factory LoginCredentialsDto.fromJson(Map<String, dynamic> json) =>
      _$LoginCredentialsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginCredentialsDtoToJson(this);

  LoginCredentialsDto(this.username, this.password);
}

@JsonSerializable()
class LoginResponse {
  final String token;
  final String userId;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  LoginResponse(this.token, this.userId);
}
