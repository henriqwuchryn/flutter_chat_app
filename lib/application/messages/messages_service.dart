import 'dart:async';

import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:signalr_netcore/hub_connection.dart';

import '../../model/message.dart';
import 'api/messages_api.dart';

@Singleton()
class MessagesService {
  MessagesService(this._messagesApi, this._hub);

  final HubConnection _hub;
  final MessagesApi _messagesApi;

  final Rx<List<Message>?> messageRx = Rx<List<Message>?>(null);

  Stream<List<Message>?> get messageStream => messageRx.stream;

  List<Message>? get messageList => messageRx.value;

  Future<void> createMessage(String roomId, String body) async {
    var dto = PostMessageDto(roomId, body);
    await _messagesApi.postMessage(dto);
    loadMessages(roomId);
  }

  Future<void> loadMessages(roomId) async {
    messageRx.value = await getMessages(roomId);
  }

  Future<List<Message>?> getMessages(roomId) async {
    var messageList = await _messagesApi.listMessages(roomId);
    return messageList;
  }

  Future<void> editMessage(String messageId, String body) async {
    var dto = PatchMessageDto(messageId, body);
    await _messagesApi.patchMessage(dto);
  }

  Future<void> deleteMessage(String messageId) async {
    await _messagesApi.deleteMessage(messageId);
  }

//TODO presenter
}
