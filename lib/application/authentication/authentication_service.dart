import 'package:chatzera/application/authentication/auth_storage.dart';
import 'package:chatzera/model/auth/auth.dart';
import 'package:injectable/injectable.dart';

import 'api/authentication_api.dart';

@Singleton()
class AuthenticationService {
  AuthenticationService(this._authenticationApi, this.authStorage);


  final AuthenticationApi _authenticationApi;
  final AuthStorage authStorage;


  Future<void> login(String username, String password) async {
    LoginCredentialsDto credentials = LoginCredentialsDto(username, password);
    var request = await _authenticationApi.login(credentials);
    var auth = Auth(request.userId, request.token);
    await authStorage.setAuth(auth);
  }

  Future<void> register(String username, String password) async {
    RegisterCredentialsDto credentials =
        RegisterCredentialsDto(username, password);
    await _authenticationApi.register(credentials);
    await login(username, password);
  }

  Future<bool> isAuthenticated() async {
    return authStorage.currentAuth != null;
  }
}
