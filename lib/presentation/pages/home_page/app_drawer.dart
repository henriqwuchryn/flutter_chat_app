import 'package:chatzera/presentation/pages/account_settings_page.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Text("Options", style: TextStyle(color: Colors.white))),
          ListTile(
              title: const Text("Account Options"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountSettingsPage()));
              }),
          ListTile(
              title: const Text("App Settings"),
              onTap: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
