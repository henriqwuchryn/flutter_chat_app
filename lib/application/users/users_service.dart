import 'package:chatzera/application/users/users_api.dart';
import 'package:injectable/injectable.dart';

import '../../model/user.dart';

@Singleton()
class UsersService {
  UsersService(this._usersApi);

  final UsersApi _usersApi;

  Future<User> getUserById(String userId) async {
    return await _usersApi.getUserById(userId);
  }

  Future<List<User>> getUsers() async {
    return await _usersApi.getUsers();
  }

  Future<void> changePassword(String oldPassword, String newPassword) async {
    var dto = PatchPasswordDto(oldPassword, newPassword);
    await _usersApi.patchPassword(dto);
  }

  Future<void> deleteUser(String userId) async {
    await _usersApi.deleteUser(userId);
  }

  Future<User> getCurrentUser() {
    return _usersApi.getCurrentUser();
  }
}
