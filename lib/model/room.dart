import 'message.dart';
import 'user.dart';

class Room {
  final String name;
  final String id;
  List<Message> messages = [];
  List<User> users = [];

  Room(this.name, this.id);

}
