import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authentication_api.g.dart';

@Injectable()
class AuthenticationApi {
  AuthenticationApi(this.dio);

  final Dio dio;

  Future<LoginResponse> login(LoginCredentialsDto credentials) async {
    var requestBody = credentials.toJson();
    final request = await dio.post(
      "/Auth/Login",
      data: requestBody,
    );
    final responseBody = request.data;
    var loginResponse = LoginResponse.fromJson(responseBody);
    return loginResponse;
  }

  Future<void> register(RegisterCredentialsDto credentials) async {
    var requestBody = credentials.toJson();
    await dio.post("/Auth/Register", data: requestBody);
  }
}

@JsonSerializable()
class LoginCredentialsDto {
  final String userName;
  final String password;

  factory LoginCredentialsDto.fromJson(Map<String, dynamic> json) =>
      _$LoginCredentialsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginCredentialsDtoToJson(this);

  LoginCredentialsDto(this.userName, this.password);
}

@JsonSerializable()
class RegisterCredentialsDto {
  final String userName;
  final String password;

  RegisterCredentialsDto(this.userName, this.password);

  factory RegisterCredentialsDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterCredentialsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterCredentialsDtoToJson(this);
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
