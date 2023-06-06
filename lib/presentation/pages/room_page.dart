import 'package:flutter/material.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Room Name")),
      body: Stack(children: [
        ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              title: Text("Author"),
              subtitle: Text("Message body"),
            ),
            ListTile(
              title: Text("Author"),
              subtitle: Text("Message body"),
            ),
            ListTile(
              title: Text("Author"),
              subtitle: Text("Message body"),
            ),
            ListTile(
              title: Text("Author"),
              subtitle: Text("Message body"),
            ),
            ListTile(
              title: Text("Author"),
              subtitle: Text("Message body"),
            ),
            ListTile(
              title: Text("Author"),
              subtitle: Text("Message body"),
            ),
            ListTile(
              title: Text("Author"),
              subtitle: Text("Message body"),
            ),
            ListTile(
              title: Text("Author"),
              subtitle: Text("Message bssssssssody"),
            ),
          ],
          padding: const EdgeInsets.only(bottom: 40),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(10)),
                height: 30,
                alignment: Alignment.center,
                child: Text("Send a new message",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white))))
      ]),
    );
  }
}
