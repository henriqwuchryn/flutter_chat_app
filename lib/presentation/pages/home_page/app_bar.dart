import 'package:flutter/material.dart';

PreferredSizeWidget appBar(){
  return AppBar(
      // leading: IconButton(
      //     padding: const EdgeInsets.all(10),
      //     icon: const Icon(Icons.list),
      //     onPressed: () {Drawer();}),
      title: TextField(
          decoration: InputDecoration(hintText: "Search Rooms")),
      actions: [
        IconButton(
            padding: const EdgeInsets.all(15),
            icon: const Icon(Icons.add_box),
            tooltip: "Create a New Room!",
            onPressed: () {})
      ]);
}