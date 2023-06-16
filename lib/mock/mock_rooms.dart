import 'package:chatzera/model/user.dart';
import 'package:chatzera/model/message.dart';

import '../model/room.dart';

final mockRooms = [
  Room("room", "1"),
  Room("room2", "2"),
  Room("room3", "3"),
  Room("room4", "4"),
  Room("room5", "5"),
  Room("room6", "6"),
];

final mockUsers = [
  User("user1", "11"),
  User("user2", "22"),
  User("user3", "33"),
  User("user4", "44"),
  User("user5", "55"),
  User("user6", "66"),
];

final mockMessages = [
  Message("11", "message1", DateTime.now(), "1"),
  Message("22", "message2", DateTime.now(), "2"),
  Message("33", "message3", DateTime.now(), "3"),
  Message("44", "message4", DateTime.now(), "4"),
  Message("55", "message5", DateTime.now(), "5"),
  Message("66", "message6", DateTime.now(), "6"),
];
