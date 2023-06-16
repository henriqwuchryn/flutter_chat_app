import 'dart:convert';
import 'dart:io';
import 'package:chatzera/model/message.dart';
import 'package:chatzera/application/api.dart';
import 'package:chatzera/presentation/pages/authentication_page/authentication_page.dart';
import 'package:http/http.dart' as http;

class AuthenticationApi {
  HttpClient httpClient = HttpClient();

  Future<String> login(String loginJson) async {
    http.Response request = await http.post(Uri.parse("$baseUrl/Auth/Login"),
        body: loginJson,
        headers: {
          "content-type": "application/json",
          "accept": "application/json"
        });
    String body = request.body;
    String token = jsonDecode(body).toString();
    print(token);
    return token;
  }
}
