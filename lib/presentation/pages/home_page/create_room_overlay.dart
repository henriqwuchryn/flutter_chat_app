import 'package:chatzera/application/rooms/rooms_service.dart';
import 'package:flutter/material.dart';

import '../../../get_it_config.dart';

class CreateRoomOverlay extends StatelessWidget {
  CreateRoomOverlay({super.key});

  final RoomsService _roomsService = getIt<RoomsService>();
  late String roomName;
  late String roomDescription;

  @override
  Widget build(context) {
    return Dialog(
      child: Container(
        height: 330,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: BackButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: TextField(
                  decoration: const InputDecoration(hintText: "Room Name"),
                  onChanged: (value) => roomName = value),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: TextField(
                  minLines: 2,
                  maxLines: 2,
                  decoration:
                      const InputDecoration(hintText: "Room Description"),
                  onChanged: (value) => roomDescription = value),
            ),
            ElevatedButton(
                onPressed: () {
                  _roomsService.addRoom(roomName, roomDescription);
                  Navigator.pop(context);
                },
                child: const Text(
                  "Create Room",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
