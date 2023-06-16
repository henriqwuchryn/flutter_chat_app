import 'dart:convert';
import 'package:chatzera/application/authentication/authentication_api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({
    super.key,
    this.prefs,
  });
  final SharedPreferences? prefs;
  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState(prefs);
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  _AuthenticationPageState(this.prefs);
  SharedPreferences? prefs;

  final AuthenticationApi _authenticationApi = AuthenticationApi();

  late String username;
  late String password;
  late String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Column(
          children: [
            const Text(
              "Insert your credentials",
              style: TextStyle(fontSize: 20),
            ),
            Container(
              padding: const EdgeInsets.only(left: 65, right: 65),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: "Username",
                  contentPadding: EdgeInsets.all(15),
                ),
                onChanged: (value) => username = value,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 65, right: 65),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: "Password",
                  contentPadding: EdgeInsets.all(15),
                ),
                onChanged: (value) => password = value,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () async {
                  String loginJson = JsonEncoder()
                      .convert({'userName': username, 'password': password});
                  token = await _authenticationApi.login(loginJson);
                  await prefs?.setBool('isAuthenticated', true);
                  await prefs?.setString('Token', token);
                },
                child: const Text("Login"),
              ),
            )
          ],
        ));
  }
}
