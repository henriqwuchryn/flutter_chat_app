import 'dart:async';
import '../../model/message.dart';
import 'api/messages_api.dart';

class MessagesService {
  static MessagesService? _instance;
  static MessagesService get instance {
    return _instance ??= MessagesService._constructor();
  }

  final MessagesApi _messagesApi = MessagesApi();

  late StreamController<List<Message>> messagesStreamController;
  late List<Message> messageList;

  Stream<List<Message>> getMessages() {
    return messagesStreamController.stream;
  }

  void addMessage(Message message) {
    //TODO: implement addMessage
  }

  Future<List<Message>> getMessagesByRoomId(String roomId) async {
    List<Message> messageList = await _messagesApi.listMessages(roomId);
    instance.messagesStreamController.add(messageList);
    return messageList;
  }

  MessagesService._constructor() {
    messagesStreamController = StreamController.broadcast(
        onListen: () => messagesStreamController.add(messageList));
  }
}
