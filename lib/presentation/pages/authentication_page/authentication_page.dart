import 'package:chatzera/application/authentication/authentication_service.dart';
import 'package:chatzera/main.dart';
import 'package:flutter/material.dart';

import '../../../get_it_config.dart';
import '../home_page/home_page.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({
    super.key,
  });

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final AuthenticationService _authenticationService =
      getIt<AuthenticationService>();
  late String username;
  late String password;
  late String token; //remove?

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login / Register"),
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
                  if (!context.mounted) {
                    return;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ),
                  );
                },
                child: const Text("Login"),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () async {
                  await _authenticationService.register(username, password);
                  if (!context.mounted) return;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ),
                  );
                },
                child: const Text("Register"),
              ),
            )
          ],
        ));
  }
}
