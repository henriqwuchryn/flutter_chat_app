import 'dart:convert';
import 'dart:io';
import 'package:chatzera/application/authentication/authentication_service.dart';
import 'package:chatzera/model/room.dart';
import 'package:chatzera/application/api.dart';
import 'package:chatzera/application/api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RoomsApi {
  HttpClient httpClient = HttpClient();
  AuthenticationService _authenticationService = AuthenticationService();

  Future<List<Room>> listRooms() async {
    http.Response request = await http.get(Uri.parse("$baseUrl/Rooms"));
    String body = request.body;
    List<dynamic> decodedBody = jsonDecode(body);
    List<Room> roomList = decodedBody
        .map(
          (element) => Room(element['name'], element['id']),
        )
        .toList();
    return roomList;
  }

  Future<Room> getRoomById(String roomId) async {
    http.Response request = await http.get(Uri.parse("$baseUrl/Rooms/$roomId"));
    String body = request.body;
    dynamic decodedBody = jsonDecode(body);
    Room room = Room(decodedBody['name'], decodedBody['id']);
    return room;
  }

  void postRoom(String roomName) async {
    var roomNameJson = jsonEncode({'roomName': roomName, 'description': ''});
    var auth = await _authenticationService.getAuth();
    var token = auth?.token;
    if (token == null) {
      throw Exception("token is null");
    }
    http.Response response = await http.post(
      Uri.parse("$baseUrl/me/room"),
      body: roomNameJson,
      headers: {'Authorization': 'Bearer $token', ...baseHeader},
    );

  }
}
