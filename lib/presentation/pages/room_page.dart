import 'package:chatzera/application/messages/messages_service.dart';
import 'package:chatzera/application/rooms/rooms_service.dart';
import 'package:flutter/material.dart';
import 'package:chatzera/model/message.dart';
import 'package:chatzera/model/room.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({Key? key, required this.roomId}) : super(key: key);
  final String roomId;
  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  var messageList = [];
  final MessagesService _messagesService = MessagesService.instance;
  final RoomsService _roomsService = RoomsService.instance;
  Room? room;
  @override
  void initState() {
    _roomsService.getRoomById(widget.roomId).then((value) => setState(() {
          room = value;
        }));
    setState(() {
      _messagesService
          .getMessagesByRoomId(widget.roomId)
          .then((value) => messageList = value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(room?.name ?? "")),
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
    );
  }
}

class NewMessageButton extends StatelessWidget {
  const NewMessageButton({
    super.key,
  });

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
      child: const Text(
        "Send a new message",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
