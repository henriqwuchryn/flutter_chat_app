import 'package:chatzera/model/room.dart';
import 'package:chatzera/presentation/pages/room_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../application/rooms/rooms_service.dart';
import 'app_bar.dart';
import 'app_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  var roomList = [];
  final RoomsService _roomsService = RoomsService.instance;

  @override
  void initState() {
    _roomsService.getRooms().listen((event) {
      setState(() {
        roomList = event;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      drawer: const AppDrawer(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [for (Room room in roomList) RoomListTile(room: room)],
            ),
          )
        ],
      ),
    );
  }
}

class RoomListTile extends StatelessWidget {
  const RoomListTile({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(room.name),
      // ignore: prefer_const_constructors
      trailing: Icon(Icons.circle, color: Colors.deepPurpleAccent),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RoomPage(roomId: room.id),
            settings: RouteSettings(arguments: room.id),
          ),
        );
      },
    );
  }
}

typedef RoomListCallback = void Function(List<Room> roomList);

class CreateRoomOverlay extends StatelessWidget {
  CreateRoomOverlay({super.key, required this.roomListCallback});

  final RoomListCallback roomListCallback;
  final RoomsService _roomsService = RoomsService.instance;

  @override
  Widget build(context) {
    return Dialog(
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            const Text(
              "Create Room",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: TextField(
                decoration: const InputDecoration(
                    hintText: "e.g.: My Room"),
                onTapOutside: (event) => Navigator.pop(context),
                onSubmitted: (value) {
                  _roomsService.addRoom(value);
                  Navigator.pop(context);
                  var roomList = _roomsService
                      .getRooms()
                      .listen;
                  roomListCallback(roomList as List<Room>);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}