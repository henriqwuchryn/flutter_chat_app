import 'dart:convert';

import 'package:chatzera/model/auth/auth.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton()
class AuthStorage {
  final Rx<Auth?> _currentAuthRx = Rx<Auth?>(null);

  Auth? get currentAuth => _currentAuthRx.value;

  Stream<Auth?> get currentAuthStream => _currentAuthRx.stream;

  AuthStorage();

  Future<void> init() async {
    await _loadAuth();
  }

  Future<void> setAuth(Auth auth) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth', jsonEncode(auth.toJson()));
    _loadAuth();
  }

  Future<void> _loadAuth() async {
    var prefs = await SharedPreferences.getInstance();
    var authJson = prefs.getString('auth');
    if (authJson == null) {
      logout();
      return;
    }
    try {
      Auth auth = Auth.fromJson(jsonDecode(authJson));
      _currentAuthRx.value = auth;
    } catch (e) {
      logout();
    }
  }

  Future<void> logout() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth');
    await prefs.remove('createdAt');
    _currentAuthRx.value = null;
  }
}
