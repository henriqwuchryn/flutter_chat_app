import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../model/user.dart';

part 'users_api.g.dart';

@Injectable()
class UsersApi {
  UsersApi(this.dio);

  final Dio dio;

  Future<User> getUserById(String userId) async {
    var request = await dio.get("/Users/$userId");
    var user = User.fromJson(request.data);
    return user;
  }

  Future<List<User>> getUsers() async {
    var request = await dio.get("/Users");
    var userList =
        (request.data).map((element) => User.fromJson(element)).toList();
    return userList;
  }

  Future<void> patchPassword(PatchPasswordDto dto) async {
    await dio.patch("/Me/Password", data: dto.toJson());
  }

  Future<void> deleteUser(String userId) async {
    await dio.delete("/Me/User/$userId");
  }

  Future<User> getCurrentUser() async {
    var request = await dio.get("Me");
    return User.fromJson(request.data);
  }
}

@JsonSerializable()
class PatchPasswordDto {
  final String oldPassword;
  final String newPassword;

  PatchPasswordDto(this.oldPassword, this.newPassword);

  factory PatchPasswordDto.fromJson(Map<String, dynamic> json) =>
      _$PatchPasswordDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PatchPasswordDtoToJson(this);
}
