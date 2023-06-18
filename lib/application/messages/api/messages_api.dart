import 'dart:convert';
import 'dart:io';
import 'package:chatzera/model/message.dart';
import 'package:chatzera/application/api.dart';
import 'package:http/http.dart' as http;

class MessagesApi {
  HttpClient httpClient = HttpClient();

  Future<List<Message>> listMessages(String roomId) async {
    http.Response request =
        await http.get(Uri.parse("$baseUrl/Rooms/$roomId/Messages"));
    String body = request.body;
    List<dynamic> decodedBody = jsonDecode(body);
    List<Message> messageList = decodedBody
        .map((element) => Message(element['author']['id'], element['body'],
            DateTime.parse(element['createdAt']), roomId))
        .toList();
    return messageList;
  }
}
