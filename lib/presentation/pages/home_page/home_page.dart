import 'package:chatzera/model/room.dart';
import 'package:chatzera/presentation/pages/room_page.dart';
import 'app_bar.dart';
import 'package:flutter/material.dart';
import '../../../application/rooms_service.dart';
import 'app_drawer.dart';

class RoomSelectPage extends StatefulWidget {
  const RoomSelectPage({super.key});

  @override
  State<RoomSelectPage> createState() {
    return _RoomSelectPageState();
  }
}

class _RoomSelectPageState extends State<RoomSelectPage> {
  var roomList = [];

  @override
  void initState() {
    setState(() {
      roomList = RoomsService().getRooms();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        drawer: const AppDrawer(),
        backgroundColor: Colors.white,
        body: Column(children: [
          Expanded(
              child: ListView(children: [
            for (Room room in roomList)
              ListTile(
                  title: Text(room.name),
                  trailing: Icon(Icons.circle, color: Colors.deepPurpleAccent),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RoomPage()));
                  })
          ]))
        ]));
  }
}
