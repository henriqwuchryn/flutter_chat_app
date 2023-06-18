import 'dart:convert';
import 'package:chatzera/application/authentication/api/authentication_api.dart';
import 'package:flutter/material.dart';
import 'package:chatzera/application/authentication/authentication_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_page/home_page.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({
    super.key,
  });

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final AuthenticationService _authenticationService = AuthenticationService();

  late String username;
  late String password;
  late String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
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
                  await _authenticationService.login(username, password);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const HomePage();
                      },
                    ),
                  );
                },
                child: const Text("Login"),
              ),
            )
          ],
        ));
  }
}
