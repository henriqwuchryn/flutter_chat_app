import 'package:chatzera/presentation/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';

import '../../../model/room.dart';

PreferredSizeWidget appBar(BuildContext context) {
  return AppBar(
    // leading: IconButton(
    //     padding: const EdgeInsets.all(10),
    //     icon: const Icon(Icons.list),
    //     onPressed: () {Drawer();}),
    title: const TextField(decoration: InputDecoration(hintText: "Search Rooms")),
    actions: [
      IconButton(
        padding: const EdgeInsets.all(15),
        icon: const Icon(Icons.add_box),
        tooltip: "Create a New Room!",
        onPressed: () {
          Navigator.push<void>(
            context,
            MaterialPageRoute<void>(
              builder: (context) => CreateRoomOverlay(roomListCallback: (List<Room> roomList) {  },),

            ),
          );
        },
      )
    ],
  );
}
