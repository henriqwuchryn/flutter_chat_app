import 'package:chatzera/model/room.dart';
import 'package:chatzera/presentation/pages/room_page.dart';
import 'package:flutter/material.dart';

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
