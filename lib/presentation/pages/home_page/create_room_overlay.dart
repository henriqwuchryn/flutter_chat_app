import 'package:flutter/material.dart';
import 'package:chatzera/application/rooms/rooms_service.dart';

class CreateRoomOverlay extends StatelessWidget {
  CreateRoomOverlay({super.key});

  final RoomsService _roomService = RoomsService.instance;

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
                decoration: const InputDecoration(hintText: "e.g.: My Room"),
                onTapOutside: (event) => Navigator.pop(context),
                onSubmitted: (value) {
                  _roomService.addRoom(value);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
