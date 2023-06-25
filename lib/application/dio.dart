import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

String baseUrl = "http://10.0.2.2:5266";
Map<String, String> baseHeader = {
  "content-type": "application/json",
  "accept": "application/json"
};

final dioClient = Dio(BaseOptions(headers: baseHeader, baseUrl: baseUrl))
  ..interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      var prefs = await SharedPreferences.getInstance();
      var authString = prefs.getString('auth');
      if (authString == null) {
        return handler.next(options);
      }
      var auth = jsonDecode(authString);
      options.headers['Authorization'] = "Bearer ${auth['token']}";
      return handler.next(options);
    },
  ));
