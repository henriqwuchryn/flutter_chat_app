import 'package:chatzera/presentation/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chatzera/presentation/pages/authentication_page/authentication_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(ChatApp(prefs: prefs));
}

class ChatApp extends StatelessWidget {
  final SharedPreferences? prefs;
  const ChatApp({super.key, this.prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Chat',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // ignore: prefer_const_constructors
        home: _decideHomePage(),
        debugShowCheckedModeBanner: false);
  }

  _decideHomePage() {
    if (prefs?.getBool('isAuthenticated') != null) {
      if (prefs!.getBool('isAuthenticated') == true) {
        return HomePage();
      } else {
        return AuthenticationPage();
      }
    } else {
      return AuthenticationPage(prefs: prefs);
    }
  }
}
