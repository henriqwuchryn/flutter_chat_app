import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api/authentication_api.dart';
import 'package:chatzera/model/auth/auth.dart';

class AuthenticationService {
  AuthenticationService();

  final AuthenticationApi _authenticationApi = AuthenticationApi();

  Rx<Auth?> _currentAuthRx = Rx<Auth?>(null);

  Stream<Auth?> get currentAuth => _currentAuthRx.stream;

  Future<void> login(String username, String password) async {
    LoginCredentialsDto credentials = LoginCredentialsDto(username, password);
    var loginResponse = await _authenticationApi.login(credentials);
    var auth = Auth(loginResponse.userId, loginResponse.token);
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth', jsonEncode(auth.toJson()));
    await loadAuth();
  }

  Future<Auth?> getAuth() async {
    await loadAuth();
    Auth? auth = _currentAuthRx.value;
    if (auth == null) {
      return null;
    }
    return auth;
  }

  Future<void> logout() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove('Token');
    _currentAuthRx.value = null;
  }

  Future<bool> isAuthenticated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var auth = prefs.getString('auth');
    return auth != null;
  }

  Future<void> loadAuth() async {
    var prefs = await SharedPreferences.getInstance();
    var authJson = prefs.getString('auth');
    if (authJson == null) {
      return;
    }
    try {
      Auth auth = Auth.fromJson(jsonDecode(authJson));
      _currentAuthRx.value = auth;
    } catch (e) {
      print(e);
    }
  }
}
