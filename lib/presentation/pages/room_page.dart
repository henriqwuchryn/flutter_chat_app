import 'package:chatzera/application/authentication/auth_storage.dart';
import 'package:chatzera/application/messages/messages_service.dart';
import 'package:chatzera/application/rooms/rooms_service.dart';
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
  final AuthStorage _authStorage = getIt<AuthStorage>();
  final MessagesService _messagesService = getIt<MessagesService>();
  final RoomsService _roomsService = getIt<RoomsService>();

  @override
  void initState() {
    setState(() {
      _messagesService.loadMessages(widget.room.id);
    });
    super.initState();
  }

  void callback(String messageText) {
    _messagesService.createMessage(widget.room.id, messageText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.room.name), actions: [
        IconButton(
          icon: const Icon(Icons.description),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => Dialog(
                child: Column(mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BackButton(),
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                        child: Text(widget.room.description),),
                  ],
                ),
              ),
            );
          },
        )
      ]),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<Message>?>(
                stream: _messagesService.messageStream,
                builder: (context, snapshot) {
                  return ListView(
                    reverse: true,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(bottom: 40),
                    children: [
                      for (Message message in snapshot.data ?? [])
                        MessageListTile(message: message)
                    ],
                  );
                }),
          ),
          // ignore: prefer_const_constructors
          Align(
            alignment: Alignment.bottomCenter,
            child: MessageField(
              callback: callback,
            ),
          ),
        ],
      ),
    );
  }
}

class MessageListTile extends StatelessWidget {
  MessageListTile({
    super.key,
    required this.message,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(message.body),
      subtitle: Text(message.author.userName),
      // trailing: Text("${message.createdAt.hour.toString()}:${message.createdAt.minute}"),
    );
  }
}

class MessageField extends StatefulWidget {
  const MessageField({super.key, required this.callback});

  final void Function(String body) callback;

  @override
  State<MessageField> createState() => _MessageFieldState();
}

class _MessageFieldState extends State<MessageField> {
  final textController = TextEditingController();

  late String body;

  @override
  void dispose() {
    super.dispose();
    return textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          hintText: "Send a new message",
          suffix: IconButton(
            onPressed: () {
              widget.callback(body);
              textController.clear();
            },
            icon: const Icon(Icons.send, color: Colors.white),
          ),
        ),
        textAlign: TextAlign.justify,
        style: const TextStyle(color: Colors.white),
        onChanged: (value) => body = value,
        minLines: 1,
        maxLines: 3,
      ),
    );
  }
}
