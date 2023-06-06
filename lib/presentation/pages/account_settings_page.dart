import 'package:flutter/material.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Account Options")),
        body: ListView(children: [
          ListTile(title: Text("Manage your Rooms"), onTap: () {}),
          ListTile(title: Text("Update Password"), onTap: () {}),
          ListTile(title: Text("Delete Account"), onTap: () {})
        ]));
  }
}
