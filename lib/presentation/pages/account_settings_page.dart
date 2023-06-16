import 'package:flutter/material.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Account Options")),
        body: ListView(children: [
          ListTile(title: const Text("Manage your Rooms"), onTap: () {}),
          ListTile(title: const Text("Update Password"), onTap: () {}),
          ListTile(title: const Text("Delete Account"), onTap: () {})
        ]));
  }
}
