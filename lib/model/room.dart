import 'package:chatzera/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable()
class Room {
  final String id;
  final String name;
  final String description;
  final List<User> users;

  Room(this.id, this.name, this.description, this.users);

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
