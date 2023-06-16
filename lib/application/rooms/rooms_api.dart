import 'dart:convert';
import 'dart:io';
import 'package:chatzera/model/room.dart';
import 'package:chatzera/application/api.dart';
import 'package:http/http.dart' as http;

class RoomsApi {
  HttpClient httpClient = HttpClient();

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
    var roomNameJson = JsonEncoder().convert(roomName);
    http.Response request =
        await http.post(Uri.parse("$baseUrl/me/room"), body: roomNameJson);
  }
}
