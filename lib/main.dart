import 'package:chatzera/application/authentication/authentication_service.dart';
import 'package:chatzera/presentation/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chatzera/presentation/pages/authentication_page/authentication_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  ChatApp({super.key});

  final AuthenticationService _authenticationService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Chat',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder(
          builder: (context, snapshot) {
            bool isAuthenticated = snapshot.data ?? false;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (isAuthenticated) {
              return HomePage();
            }
            return AuthenticationPage();
          },
          future: _authenticationService.isAuthenticated(),
        ),
        debugShowCheckedModeBanner: false);
  }
}
