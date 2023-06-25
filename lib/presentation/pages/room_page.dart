import 'package:chatzera/application/authentication/auth_storage.dart';
import 'package:chatzera/application/messages/messages_service.dart';
import 'package:chatzera/application/rooms/rooms_service.dart';
import 'package:chatzera/main.dart';
import 'package:chatzera/model/message.dart';
import 'package:chatzera/model/room.dart';
import 'package:flutter/material.dart';

import '../../get_it_config.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({
    Key? key,
    required this.room,
  }) : super(key: key);
  final Room room;

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  var messageList = [];
  final AuthStorage _authStorage = getIt<AuthStorage>();
  final MessagesService _messagesService = getIt<MessagesService>();
  final RoomsService _roomsService = getIt<RoomsService>();

  @override
  void initState() {
    setState(() {
      _messagesService
          .getMessages(widget.room.id)
          .then((value) => messageList = value);
    });
    super.initState();
  }

  void callback(String messageText) {
    _messagesService.createMessage(widget.room.id, messageText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.room.name)),
      drawer: Drawer(child: SafeArea(child: Text(widget.room.description))),
      body: Stack(children: [
        ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(bottom: 40),
          children: [
            for (Message message in messageList)
              MessageListTile(message: message)
          ],
        ),
        // ignore: prefer_const_constructors
        Align(
          alignment: Alignment.bottomCenter,
          child: const NewMessageButton(),
        )
      ]),
    );
  }
}

class MessageListTile extends StatelessWidget {
  const MessageListTile({
    super.key,
    required this.message,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(message.body),
      subtitle: Text(message.author.userName),
    );
  }
}

class NewMessageButton extends StatelessWidget {
  const NewMessageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 30,
      alignment: Alignment.center,
      child: TextField(
        decoration: const InputDecoration(hintText: "Send a new message"),
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
        onSubmitted: (value) => _RoomPageState().callback(value),
      ),
    );
  }
}
