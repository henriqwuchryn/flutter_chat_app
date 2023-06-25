import 'package:chatzera/application/authentication/auth_storage.dart';
import 'package:chatzera/application/authentication/authentication_service.dart';
import 'package:chatzera/main.dart';
import 'package:chatzera/presentation/pages/authentication_page/authentication_page.dart';
import 'package:flutter/material.dart';

import '../../../get_it_config.dart';

class AccountSettingsPage extends StatelessWidget {
  AccountSettingsPage({Key? key}) : super(key: key);
  final AuthenticationService _authenticationService =
      getIt<AuthenticationService>();
  final _authStorage = getIt<AuthStorage>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Account Options")),
      body: ListView(
        children: [
          ListTile(title: const Text("Manage your Rooms"), onTap: () {}),
          ListTile(title: const Text("Update Password"), onTap: () {}),
          ListTile(
            title: const Text("Logout"),
            onTap: () {
              _authStorage.logout();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => AuthenticationPage(),
                ),
                (Route<dynamic> route) => false,
              );
            },
          ),
          ListTile(title: const Text("Delete Account"), onTap: () {})
        ],
      ),
    );
  }
}
