import 'package:chatzera/model/room.dart';
import 'package:chatzera/presentation/pages/room_page.dart';
import 'package:flutter/material.dart';

import '../../../application/rooms/rooms_service.dart';
import '../../../get_it_config.dart';
import 'app_drawer.dart';
import 'create_room_overlay.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RoomsService _roomsService = getIt<RoomsService>();

  void callback(Room room) {
    _roomsService.deleteRoom(room.id);
  }

  @override
  Widget build(BuildContext context) {
    return PostFrameCallback(
      voidCallback: () {
        _roomsService.loadRooms();
      },
      child: StreamBuilder<List<Room>?>(
          stream: _roomsService.getRoomsStream(),
          builder: (context, snapshot) {
            List<Room>? roomList = _roomsService.roomList;
            if (roomList == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return Scaffold(
              appBar: AppBar(
                title: const TextField(
                  decoration: InputDecoration(hintText: "Search Rooms"),
                  //TODO: search
                ),
                actions: [
                  IconButton(
                      padding: const EdgeInsets.all(15),
                      icon: const Icon(Icons.add_box),
                      tooltip: "Create a New Room!",
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => CreateRoomOverlay());
                      })
                ],
              ),
              drawer: const AppDrawer(),
              body: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        for (Room room in roomList)
                          RoomListTile(
                            room: room,
                            callback: () {
                              callback(room);
                            },
                          )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}

class RoomListTile extends StatelessWidget {
  RoomListTile({
    super.key,
    required this.room,
    required this.callback,
  });

  final VoidCallback callback;
  final Key dropDownKey = GlobalKey<State<DropdownButton>>();
  final Room room;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(room.name),
      // ignore: prefer_const_constructors
      trailing: PopupMenuButton(
        key: dropDownKey,
        itemBuilder: (context) => [
          PopupMenuItem(
              onTap: () {
                callback();
              },
              child: Text("delete"))
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RoomPage(room: room),
            settings: RouteSettings(arguments: room),
          ),
        );
      },
    );
  }
}

typedef RoomListCallback = void Function(List<Room> roomList);

class PostFrameCallback extends StatefulWidget {
  const PostFrameCallback(
      {super.key, required this.voidCallback, required this.child});

  final VoidCallback voidCallback;
  final Widget child;

  @override
  State<PostFrameCallback> createState() => _PostFrameCallbackState();
}

class _PostFrameCallbackState extends State<PostFrameCallback> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.voidCallback();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
